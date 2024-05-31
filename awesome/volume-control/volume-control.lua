-- Volume Control
local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local naughty = require("naughty")

-- compatibility fallbacks for 3.5:
local timer = gears.timer or timer
local spawn = awful.spawn or awful.util.spawn
local watch = awful.spawn and awful.spawn.with_line_callback

local function exec(command, callback)
    awful.spawn.easy_async(command, callback or function() end)
end


------------------------------------------
-- Private utility functions
------------------------------------------

local function substitute(template, context)
  if type(template) == "string" then
    return (template:gsub("%${([%w_]+)}", function(key)
      return tostring(context[key] or "default")
    end))
  else
    -- function / functor:
    return template(context)
  end
end

local function new(self, ...)
    local instance = setmetatable({}, {__index = self})
    return instance:init(...) or instance
end

local function class(base)
    return setmetatable({new = new}, {
        __call = new,
        __index = base,
    })
end

------------------------------------------
-- Volume control interface
------------------------------------------

local vcontrol = class()

function vcontrol:init(args)
    self.callbacks = {}
    self.cmd = "amixer"
    self.device = args.device or nil
    self.cardid  = args.cardid or nil
    self.channel = args.channel or "Master"
    self.step = args.step or '5%'

    self.timer = timer({ timeout = args.timeout or 0.5 })
    self.timer:connect_signal("timeout", function() self:get() end)
    self.timer:start()

    if args.listen and watch then
        self.listener = watch({'stdbuf', '-oL', 'alsactl', 'monitor'}, {
          stdout = function(line) self:get() end,
        })
        awesome.connect_signal("exit", function()
            awesome.kill(self.listener, awesome.unix_signal.SIGTERM)
        end)
    end
end

function vcontrol:register(callback)
    if callback then
        table.insert(self.callbacks, callback)
    end
end

function vcontrol:action(action)
    if self[action]                   then self[action](self)
    elseif type(action) == "function" then action(self)
    elseif type(action) == "string"   then spawn(action)
    end
end

function vcontrol:update(status)
    local volume = status:match("(%d?%d?%d)%%")
    local state  = status:match("%[(o[nf]*)%]")
    if volume and state then
        local volume = tonumber(volume)
        local state = state:lower()
        local muted = state == "off"
        for _, callback in ipairs(self.callbacks) do
            callback(self, {
                volume = volume,
                state = state,
                muted = muted,
                on = not muted,
            })
        end
    end
end

function vcontrol:mixercommand(args, callback)
    local args = awful.util.table.join(
      {self.cmd},
      (self.cmd == "amixer") and {"-M"} or {},
      self.device and {"-D", self.device} or {},
      self.cardid and {"-c", self.cardid} or {},
      args)
    exec(args, callback or function(output)
        self:update(output)
    end)
end

function vcontrol:get()
    self:mixercommand({ "get", self.channel })
end

function vcontrol:up()
    self:mixercommand({ "set", self.channel, self.step .. "+" })
end

function vcontrol:down()
    self:mixercommand({ "set", self.channel, self.step .. "-" })
end

function vcontrol:toggle()
    self:mixercommand({ "set", self.channel, "toggle" })
end

function vcontrol:mute()
    self:mixercommand({ "set", "Master", "mute" })
end

function vcontrol:unmute()
    self:mixercommand({ "set", "Master", "unmute" })
end

function vcontrol:list_sinks(callback)
    exec("env LC_ALL=C pactl list sinks", function(output)
        local sinks = {}
        local sink
        for line in output:gmatch("[^\r\n]+") do
            if line:match("Sink #%d+") then
                sink = {}
                table.insert(sinks, sink)
            else
                local k, v = line:match("^%s*(%S+):%s*(.-)%s*$")
                if k and v then sink[k:lower()] = v end
            end
        end
        callback(sinks)
    end)
end

function vcontrol:set_default_sink(name, callback)
    exec({"pactl set-default-sink", name}, callback)
end

------------------------------------------
-- Volume control widget
------------------------------------------

-- derive so that users can still call up/down/mute etc
local vwidget = class(vcontrol)

function vwidget:init(args)
    vcontrol.init(self, args)

    self.lclick = args.lclick or "toggle"
    self.mclick = args.mclick or "pavucontrol"
    self.rclick = args.rclick or self.show_menu

    self.font = args.font        or nil
    self.widget = args.widget    or (self:create_widget(args)  or self.widget)
    self.tooltip = args.tooltip and (self:create_tooltip(args) or self.tooltip)

    self:register(args.callback or self.update_widget)
    self:register(args.tooltip and self.update_tooltip)

    self.widget:buttons(awful.util.table.join(
        awful.button({}, 1, function() self:action(self.lclick) end),
        awful.button({}, 2, function() self:action(self.mclick) end),
        awful.button({}, 3, function() self:action(self.rclick) end),
        awful.button({}, 4, function() self:up() end),
        awful.button({}, 5, function() self:down() end)
    ))

    self:get()
end

-- text widget
function vwidget:create_widget(args)
    self.widget_text = args.widget_text or {
        on  = '% 3d%% ',
        off = '% 3dM ',
    }
    self.widget = wibox.widget.textbox()
    if self.font then
      self.widget.font = self.font
    end
    self.widget.set_align("right")
end

function vwidget:create_menu(callback)
    self:list_sinks(function(sinks)
        local sinks_submenu = {}
        for i, sink in ipairs(sinks) do
            table.insert(sinks_submenu, {sink.description, function()
                self:set_default_sink(sink.name)
            end})
        end
        callback(awful.menu { items = {
            { "mute", function() self:mute() end },
            { "unmute", function() self:unmute() end },
            { "Default Sink", sinks_submenu },
            { "pavucontrol", function() self:action("pavucontrol") end },
        } })
    end)
end

function vwidget:show_menu()
    if self.menu then
        self.menu:hide()
    else
        self:create_menu(function(menu)
            self.menu = menu
            self.menu:show()
            self.menu.wibox:connect_signal("property::visible", function()
                self.menu = nil
            end)
        end)
    end
end

function vwidget:update_widget(setting)
    self.widget:set_markup(
        self.widget_text[setting.state]:format(setting.volume))
end

-- tooltip
function vwidget:create_tooltip(args)
    self.tooltip_text = args.tooltip_text or [[
Volume: ${volume}% ${state}
Channel: ${channel}
Device: ${device}
Card: ${card}]]
    self.tooltip = args.tooltip and awful.tooltip({objects={self.widget}})
end

function vwidget:update_tooltip(setting)
    self.tooltip:set_text(substitute(self.tooltip_text, {
        volume  = setting.volume,
        state   = setting.state,
        device  = self.device,
        card    = self.card,
        channel = self.channel,
    }))
end

-- provide direct access to the control class
vwidget.control = vcontrol
return vwidget
