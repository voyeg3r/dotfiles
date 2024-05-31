-- Filename: /home/sergio/.config/awesome/rc.lua
-- Last Change: Tue, 04 Oct 2022 13:47:47
-- vim:set softtabstop=2 shiftwidth=2 tabstop=2 expandtab ft=lua:

-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local watch = require("awful.widget.watch")
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local lain = require("lain")
local volume_control= require("volume-control")
local net_widgets = require("net_widgets")
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

-- scratchpad terminal
local scratch = require("awesome-scratch.scratch")
screen_width = awful.screen.focused().geometry.width
screen_height = awful.screen.focused().geometry.height

-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
  naughty.notify({ preset = naughty.config.presets.critical,
    title = "Oops, there were errors during startup!",
    text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
  local in_error = false
  awesome.connect_signal("debug::error", function (err)
    -- Make sure we don't go into an endless error loop
    if in_error then return end
    in_error = true

    naughty.notify({ preset = naughty.config.presets.critical,
      title = "Oops, an error happened!",
      text = tostring(err) })
    in_error = false
  end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
-- beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
local home = os.getenv("HOME") or "/home/sergio"
local theme_name = "Nord"
beautiful.init( home .. "/.config/awesome/themes/" .. theme_name .. "/theme.lua")

-- This is used later as the default terminal and editor to run.
-- terminal = os.getenv("TERMINAL") or "st"
terminal = "st"
editor = os.getenv("EDITOR") or "nano"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
  awful.layout.suit.tile,
  awful.layout.suit.floating,
  awful.layout.suit.tile.top,
  awful.layout.suit.tile.bottom,
  awful.layout.suit.tile.left,
  -- awful.layout.suit.fair,
  -- awful.layout.suit.fair.horizontal,
  -- awful.layout.suit.spiral,
  -- awful.layout.suit.spiral.dwindle,
  -- awful.layout.suit.max,
  -- awful.layout.suit.max.fullscreen,
  -- awful.layout.suit.magnifier,
  -- awful.layout.suit.corner.nw,
  -- awful.layout.suit.corner.ne,
  -- awful.layout.suit.corner.sw,
  -- awful.layout.suit.corner.se,
}
-- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
  { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
  { "manual", terminal .. " -e man awesome" },
  { "edit config", editor_cmd .. " " .. awesome.conffile },
  { "restart", awesome.restart },
  { "quit", function() awesome.quit() end },
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
  { "open terminal", terminal .. ' -f Iosvka Mayukai Original:size=15:antialias=true:autohint=true' }
}
})

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
  menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- -- Keyboard map indicator and switcher
-- mykeyboardlayout = awful.widget.keyboardlayout()
--
-- -- {{{ Wibar
-- -- Create a textclock widget
-- mytextclock = wibox.widget.textclock()

------------------------------------------------
------------------- WIDGETS --------------------
------------------------------------------------

-- Separator Blanc
tbox_separator2 = wibox.widget.textbox(" ")

-- Separator
tbox_separator = wibox.widget.textbox(" | ")

-- define your volume control, using default settings:
-- https://github.com/deficient/volume-control
-- volumecfg = volume_control({})
-- volumecfg = volume_control {device="pulse"}
volumecfg = volume_control {device="pulse"}

-- volumecfg = volume_control({
--   device  = pulse,            -- e.g.: "default", "pulse"
--   cardid  = nil,            -- e.g.: 0, 1, ...
--   channel = "Master",
--   step    = '5%',           -- step size for up/down
--   lclick  = "toggle",       -- mouse actions described below
--   mclick  = "pavucontrol",
--   rclick  = "pavucontrol",
--   listen  = true,          -- enable/disable listening for audio status changes
--   widget  = nil,            -- use this instead of creating a awful.widget.textbox
--   font    = nil,            -- font used for the widget's text
--   callback = nil,           -- called to update the widget: `callback(self, state)`
--   widget_text = {
--     on  = '% 3d%% ',        -- three digits, fill with leading spaces
--     off = '% 3dM ',
--   },
--   tooltip_text = [[
-- Volume: ${volume}% ${state}
-- Channel: ${channel}
-- Device: ${device}
-- Card: ${card}]],
-- })

-- wireless_card = awful.widget.watch('dash -c $(ip link show | awk -F: '/^3/)')
-- {print $2}'"')
wifi = net_widgets.wireless({interface="wlp6s0"})

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- Create a textclock widget
mytextclock = wibox.widget.textclock()

-- CPU
local cpu = lain.widget.cpu {
  settings = function()
    widget:set_markup("   " .. cpu_now.usage .. "%")
  end
}

-- Ram
local mymem = lain.widget.mem {
  settings = function()
    widget:set_markup("   " .. mem_now.perc .. "%")
  end
}

-- Wheather
local weather = awful.widget.watch('dash -c "curl -s  https://wttr.in/Belo-Horizonte?format="%t\n" | head -n 3"')

-- Updates
local update = awful.widget.watch('dash -c "xbps-install -nuM | wc -l ; xbps-install -nuM | awk {print $1} "')

------------------------------------------------
-------------------- WIBAR ---------------------
------------------------------------------------

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
  awful.button({ }, 1, function(t) t:view_only() end),
  awful.button({ modkey }, 1, function(t)
    if client.focus then
      client.focus:move_to_tag(t)
    end
  end),
  awful.button({ }, 3, awful.tag.viewtoggle),
  awful.button({ modkey }, 3, function(t)
    if client.focus then
      client.focus:toggle_tag(t)
    end
  end),
  awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
  awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

local tasklist_buttons = gears.table.join(
  awful.button({ }, 1, function (c)
    if c == client.focus then
      c.minimized = true
    else
      c:emit_signal(
        "request::activate",
        "tasklist",
        {raise = true}
      )
    end
  end),
  awful.button({ }, 3, function()
    awful.menu.client_list({ theme = { width = 250 } })
  end),
  awful.button({ }, 4, function ()
    awful.client.focus.byidx(1)
  end),
  awful.button({ }, 5, function ()
    awful.client.focus.byidx(-1)
  end))

local function set_wallpaper(s)
  -- Wallpaper
  if beautiful.wallpaper then
    local wallpaper = beautiful.wallpaper
    -- If wallpaper is a function, call it with the screen
    if type(wallpaper) == "function" then
      wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)
  end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
  -- Wallpaper
  set_wallpaper(s)

  -- Each screen has its own tag table.
  -- awful.tag({ "", "", "", "", "", "", "", "", "" }, s, awful.layout.layouts[1])
  awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

  -- Create an imagebox widget which will contain an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox(s)
  s.mylayoutbox:buttons(gears.table.join(
    awful.button({ }, 1, function () awful.layout.inc( 1) end),
    awful.button({ }, 3, function () awful.layout.inc(-1) end),
    awful.button({ }, 4, function () awful.layout.inc( 1) end),
    awful.button({ }, 5, function () awful.layout.inc(-1) end)))
  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = taglist_buttons
  }

  -- Create a tasklist widget
  s.mytasklist = awful.widget.tasklist {
    screen  = s,
    filter  = awful.widget.tasklist.filter.focused,
  }

  -- Create the wibox
  s.mywibox = awful.wibar({ position = "top", screen = s, visible = true, height = 22 })

  -- Add widgets to the wibox
  s.mywibox:setup {
    layout = wibox.layout.align.horizontal,
    { -- Left widgets
      layout = wibox.layout.fixed.horizontal,
      tbox_separator2,
      s.mylayoutbox,
      tbox_separator,
      s.mytaglist,
      tbox_separator,
      s.mypromptbox,
    },
    s.mytasklist, -- Middle widget
    { -- Right widgets
      layout = wibox.layout.fixed.horizontal,
      tbox_separator2,
      wibox.widget.textbox('    '),
      update,
      tbox_separator2,
      tbox_separator,
      wibox.widget.textbox('   '),
      weather,
      tbox_separator2,
      tbox_separator,
      tbox_separator2,
      volumecfg.widget,
      tbox_separator,
      mymem,
      tbox_separator,
      cpu.widget,
      tbox_separator,
      mytextclock,
      tbox_separator2,
      wifi,
      tbox_separator,
      tbox_separator2,
      wibox.widget.systray(),
      tbox_separator2,
    },
  }
end)
-- }}}

-- {{{ Mouse bindings
root.buttons(gears.table.join(
  awful.button({ }, 3, function () mymainmenu:toggle() end),
  awful.button({ }, 4, awful.tag.viewnext),
  awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = gears.table.join(
  awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
    {description="show help", group="awesome"}),
  awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
    {description = "view previous", group = "tag"}),
  awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
    {description = "view next", group = "tag"}),
  awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
    {description = "go back", group = "tag"}),

  awful.key({ "Control", "Mod1"          }, "p", awful.tag.history.restore,
    {description = "go back", group = "tag"}),

  awful.key({ modkey,           }, "j",
    function ()
      awful.client.focus.byidx( 1)
    end,
    {description = "focus next by index", group = "client"}
  ),
  awful.key({ modkey,           }, "k",
    function ()
      awful.client.focus.byidx(-1)
    end,
    {description = "focus previous by index", group = "client"}
  ),
  awful.key({ modkey,           }, "w", function () mymainmenu:show() end,
    {description = "show main menu", group = "awesome"}),

  awful.key({ modkey         },   "a",      function () awful.spawn("st -c pulsemixer -e pulsemixer ") end,
    	{description = "exec pulsemixer", group = "Personal launchers"}),

  -- Layout manipulation
  awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
    {description = "swap with next client by index", group = "client"}),

  awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
    {description = "swap with previous client by index", group = "client"}),

  -- awful.key({ modkey, "Shift"   }, "j", function (c)
  --   awful.client.swap.global_bydirection("down")
  --   c:raise()
  -- end,
  -- {description = "swap with down client by direction", group = "client"}),

  -- awful.key({ modkey, "Shift"   }, "k", function (c)
  --   awful.client.swap.global_bydirection("up")
  --   c:raise()
  -- end,
  -- {description = "swap with up client by direction", group = "client"}),
  --
  -- awful.key({ modkey, "Shift"   }, "l", function (c)
  --   awful.client.swap.global_bydirection("right")
  --   c:raise()
  -- end,
  -- {description = "swap with right client by direction", group = "client"}),
  --
  -- awful.key({ modkey, "Shift"   }, "h", function (c)
  --   awful.client.swap.global_bydirection("left")
  --   c:raise()
  -- end,
  -- {description = "swap with left client by direction", group = "client"}),

  awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
    {description = "focus the next screen", group = "screen"}),

  awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
    {description = "focus the previous screen", group = "screen"}),

  awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
    {description = "jump to urgent client", group = "client"}),

  -- awful.key({ modkey,           }, "Tab",
  --   function ()
  --     awful.client.focus.history.previous()
  --     if client.focus then
  --       client.focus:raise()
  --     end
  --   end,
  --   {description = "go back", group = "client"}),

awful.key({ modkey,           }, "Tab",
    function ()
        local c = awful.client.focus.history.list[2]
        client.focus = c
        local t = client.focus and client.focus.first_tag or nil
        if t then
            t:view_only()
        end
        c:raise()
    end,
    {description = "go back", group = "client"}),

--   -- open scratchpad
-- awful.key({ modkey }, "d", function ()
--     scratch.toggle("st -n scratch", { instance = "scratch" })
--   end,
--     { description = "Open scratchpad terminal", group = "sergio" }
--   ),

awful.key({ "Mod1" }, "c", function ()
    awful.util.spawn("clipmenu")
  end,
    { description = "Clipmenu", group = "sergio" }
  ),

awful.key({ "Control", "Mod1" }, "i", function ()
    awful.util.spawn("inkscape")
  end,
    { description = "Open inkscape", group = "sergio" }
  ),

awful.key({ "Mod1" }, "n", function ()
    awful.util.spawn("nemo")
  end,
    { description = "Open nemo file manager", group = "sergio" }
  ),

awful.key({ "Mod1" }, "p", function ()
    awful.util.spawn("pavucontrol")
  end,
    { description = "Open nemo file manager", group = "sergio" }
  ),

awful.key({ "Mod1" }, "t", function ()
    awful.util.spawn("telegram-desktop")
  end,
    { description = "Open Telegram Desktop", group = "sergio" }
  ),

awful.key({ "Mod1" }, "u", function ()
    scratch.toggle("st -n scratch", { instance = "scratch" })
  end,
    { description = "Open scratchpad terminal", group = "sergio" }
  ),

  -- paste primary selection
  awful.key({ "Shift"   }, "Insert", function ()
    awful.spawn.with_shell("xdotool click --clearmodifiers 2")    end,
    {description = "Insert primary selection", group = "sergio"}),

  awful.key({ "Control", "Mod1"   }, "t", function ()
    awful.spawn.with_shell("~/.dotfiles/bin/scratchtermtoggle")    end,
    {description = "Another scratch term", group = "sergio"}),

    -- Copy clipboard to primary (gtk to terminals)
  awful.key({ modkey }, "y", function () awful.spawn.with_shell("xclip -selection primary -o ; sleep .2") end,
            {description = "paste primary selection", group = "sergio"}),

  -- Standard terminal
  awful.key({ modkey,           }, "Return", function ()
   awful.spawn(terminal .. " -f 'Iosevka Mayukai Original:size=15:antialias=true:autohint=true'" ) end,
    {description = "open a terminal -> " .. terminal, group = "launcher"}),

  awful.key({ modkey, "Control" }, "r", awesome.restart,
    {description = "reload awesome", group = "awesome"}),

  awful.key({ modkey, "Shift"   }, "q", awesome.quit,
    {description = "quit awesome", group = "awesome"}),

  awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)  end,
    {description = "increase master width factor", group = "layout"}),

  awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)  end,
    {description = "decrease master width factor", group = "layout"}),

  awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
    {description = "increase the number of master clients", group = "layout"}),

  awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
    {description = "decrease the number of master clients", group = "layout"}),

  awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
    {description = "increase the number of columns", group = "layout"}),

  awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
    {description = "decrease the number of columns", group = "layout"}),

  awful.key({ modkey,           }, "space", function () awful.layout.inc( 1) end,

    {description = "select next", group = "layout"}),

  awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)  end,

    {description = "select previous", group = "layout"}),

  -- Non-empty tag browsing CTRL+Win j/k
  awful.key({ modkey, "Control" }, "j", function () lain.util.tag_view_nonempty(-1) end,
    {description = "view  previous nonempty", group = "tag"}),

  awful.key({ modkey, "Control" }, "k", function () lain.util.tag_view_nonempty(1) end,
    {description = "view  previous nonempty", group = "tag"}),

  awful.key({ modkey, "Control" }, "n",
    function ()
      local c = awful.client.restore()
      -- Focus restored client
      if c then
        c:emit_signal(
          "request::activate", "key.unminimize", {raise = true}
        )
      end
    end,
    {description = "restore minimized", group = "client"}),

  -- Dmenu
  awful.key({ modkey },  "r",  function () awful.util.spawn("dmenu_run") end,
    {description = "lauch dmenu", group = "sergio"}),

  awful.key({ modkey },  "F2",  function () awful.util.spawn("rofi -show drun &>> /tmp/rofi.log") end,
    {description = "lauch dmenu", group = "sergio"}),

  awful.key({ "Mod1", "Control" },  "u",  function () awful.util.spawn(terminal .. " -c stfloat") end,
    {description = "lauch dmenu", group = "sergio"}),

  -- Lauch browser (firefox)
  awful.key({ modkey },  "b",  function () awful.util.spawn("firefox") end,
    {description = "lauch firefox", group = "sergio"}),

  -- Lauch xkill
  awful.key({ "Mod1", "Control" },  "Escape",  function () awful.spawn.with_shell("xkill") end,
    {description = "lauch xkill", group = "sergio"}),

  awful.key({ "Mod1" },  "r",  function () awful.spawn.with_shell("st -c ranger -e ranger") end,
    {description = "launch ranger", group = "sergio"}),

  -- Lauch clipmenu
  awful.key({ "Mod1", "Control" },  "c",  function () awful.spawn.with_shell("clipmenu") end,
    {description = "lauch xkill", group = "sergio"}),

  awful.key({ modkey }, "x",
    function ()
      awful.prompt.run {
        prompt       = "Run Lua code: ",
        textbox      = awful.screen.focused().mypromptbox.widget,
        exe_callback = awful.util.eval,
        history_path = awful.util.get_cache_dir() .. "/history_eval"
      }
    end,
    {description = "lua execute prompt", group = "awesome"}),

  -- Menubar
  awful.key({ modkey }, "p", function()
    menubar.show()
  end,
    {description = "show the menubar", group = "launcher"})

)

clientkeys = gears.table.join(
  awful.key({ modkey,           }, "f",
    function (c)
      c.fullscreen = not c.fullscreen
      c:raise()
    end,
    {description = "toggle fullscreen", group = "client"}),
  awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end,
    {description = "close", group = "client"}),
  awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
    {description = "toggle floating", group = "client"}),
  awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
    {description = "move to master", group = "client"}),
  awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
    {description = "move to screen", group = "client"}),
  awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
    {description = "toggle keep on top", group = "client"}),
  awful.key({ modkey,           }, "n",
    function (c)
      -- The client currently has the input focus, so it cannot be
      -- minimized, since minimized clients can't have the focus.
      c.minimized = true
    end ,
    {description = "minimize", group = "client"}),
  awful.key({ modkey,           }, "m",
    function (c)
      c.maximized = not c.maximized
      c:raise()
    end ,
    {description = "(un)maximize", group = "client"}),
  awful.key({ modkey, "Control" }, "m",
    function (c)
      c.maximized_vertical = not c.maximized_vertical
      c:raise()
    end ,
    {description = "(un)maximize vertically", group = "client"}),
  awful.key({ modkey, "Shift"   }, "m",
    function (c)
      c.maximized_horizontal = not c.maximized_horizontal
      c:raise()
    end ,
    {description = "(un)maximize horizontally", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
  globalkeys = gears.table.join(globalkeys,
    -- View tag only.
    awful.key({ modkey }, "#" .. i + 9,
      function ()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          tag:view_only()
        end
      end,
      {description = "view tag #"..i, group = "tag"}),
    -- Toggle tag display.
    awful.key({ modkey, "Control" }, "#" .. i + 9,
      function ()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          awful.tag.viewtoggle(tag)
        end
      end,
      {description = "toggle tag #" .. i, group = "tag"}),
    -- Move client to tag.
    awful.key({ modkey, "Shift" }, "#" .. i + 9,
      function ()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:move_to_tag(tag)
          end
        end
      end,
      {description = "move focused client to tag #"..i, group = "tag"}),
    -- Toggle tag on focused client.
    awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
      function ()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:toggle_tag(tag)
          end
        end
      end,
      {description = "toggle focused client on tag #" .. i, group = "tag"})
  )
end

clientbuttons = gears.table.join(
  awful.button({ }, 1, function (c)
    c:emit_signal("request::activate", "mouse_click", {raise = true})
  end),
  -- paste primary selection Ctrl + button3
  awful.button({ "Mod1", "Control" }, 1, function (c)
    c:emit_signal("request::activate", "mouse_click", {raise = true})
    awful.spawn.with_shell("xdotool click --delay 0 --clearmodifiers 2")
  end),
  awful.button({ modkey }, 1, function (c)
    c:emit_signal("request::activate", "mouse_click", {raise = true})
    awful.mouse.client.move(c)
  end),
  awful.button({ modkey }, 3, function (c)
    c:emit_signal("request::activate", "mouse_click", {raise = true})
    awful.mouse.client.resize(c)
  end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {

  -- All clients will match this rule.
  { rule = { },
    properties = { border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      focus = awful.client.focus.filter,
      raise = true,
      keys = clientkeys,
      buttons = clientbuttons,
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap+awful.placement.no_offscreen
    }
  },

  -- Floating clients.
  { rule_any = {
    instance = {
      "DTA",  -- Firefox addon DownThemAll.
      "copyq",  -- Includes session name in class.
      "pinentry",
      "pulse",
    },
    class = {
      "Arandr",
      "Blueman-manager",
      "Gpick",
      "Kruler",
      "MessageWin",  -- kalarm.
      "Sxiv",
      "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
      "Wpa_gui",
      "veromix",
      "xtightvncviewer"},

    -- Note that the name property shown in xprop might be set slightly after creation of the client
    -- and the name shown there might not match defined rules here.
    name = {
      "Event Tester",  -- xev.
    },
    role = {
      "AlarmWindow",  -- Thunderbird's calendar.
      "ConfigManager",  -- Thunderbird's about:config.
      "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
    }
  }, properties = { floating = true }},

  -- Add titlebars to normal clients and dialogs
  { rule_any = {type = { "normal", "dialog" }
  }, properties = { titlebars_enabled = false }
  },

   --Set Firefox to always map on the tag named "2" on screen 1.
   { rule = { class = "Firefox" },
     properties = {  tag = "2", switchtotag = true, maximized = false } },

   { rule = { class = "Inkscape" },
     properties = {  tag = "5", switchtotag = true, maximized = false } },

   { rule = { class = "TelegramDesktop" },
     properties = {  tag = "6", switchtotag = true, maximized = false } },

   { rule = { class = "Nemo" },
     properties = {  tag = "3", switchtotag = true, maximized = false } },

   { rule = { class = "ranger" },
     properties = {  tag = "4", switchtotag = true, maximized = false } },

  { rule_any = { class = { "mpv", "pulsemixer", "scratch" }, instance = { "St" } },
    properties = { floating = true },
    callback = function(c)
      awful.placement.centered(c,nil)
    end
  },

   { rule = { class = "St" },
     properties = { tag = "1", switchtotag = true } },

   { rule = { class = "St:mpv" },
     properties = { tag = "6", switchtotag = true } },

   { rule = { class = "St:ranger" },
     properties = { tag = "4", switchtotag = true } },

  {
        rule_any = {
            instance = { "scratch" },
            class = { "scratch", "St:scratch" },
            icon_name = { "scratchpad_urxvt" },
        },
        properties = {
            skip_taskbar = false,
            floating = true,
            ontop = false,
            minimized = true,
            sticky = false,
            switchtotag = false,
            width = screen_width * 0.7,
            height = screen_height * 0.75
        },
        callback = function (c)
            awful.placement.centered(c,{honor_padding = true, honor_workarea=true})
            gears.timer.delayed_call(function()
                c.urgent = false
            end)
        end
    },

}
-- }}}

-- {{{ Signals

-- client.connect_signal("request::manage", function(client, context)
--     if client.floating and context == "new" then
--         client.placement = awful.placement.centered
--     end
-- end)

-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
  -- Set the windows at the slave,
  -- i.e. put it at the end of others instead of setting it master.
  -- if not awesome.startup then awful.client.setslave(c) end

  if awesome.startup
    and not c.size_hints.user_position
    and not c.size_hints.program_position then
    -- Prevent clients from being unreachable after screen count changes.
    awful.placement.no_offscreen(c)
  end
end)

-- https://www.reddit.com/r/awesomewm/comments/mbl8si/move_the_focus_to_the_app_instead_moving_the_app/
-- Focus urgent clients automatically
client.connect_signal("property::urgent", function(c)
	c.minimized = false
	c:jump_to()
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
  -- buttons for the titlebar
  local buttons = gears.table.join(
    awful.button({ }, 1, function()
      c:emit_signal("request::activate", "titlebar", {raise = true})
      awful.mouse.client.move(c)
    end),
    awful.button({ }, 3, function()
      c:emit_signal("request::activate", "titlebar", {raise = true})
      awful.mouse.client.resize(c)
    end)
  )

  awful.titlebar(c) : setup {
    { -- Left
      awful.titlebar.widget.iconwidget(c),
      buttons = buttons,
      layout  = wibox.layout.fixed.horizontal
    },
    { -- Middle
      { -- Title
        align  = "center",
        widget = awful.titlebar.widget.titlewidget(c)
      },
      buttons = buttons,
      layout  = wibox.layout.flex.horizontal
    },
    { -- Right
      awful.titlebar.widget.floatingbutton (c),
      awful.titlebar.widget.maximizedbutton(c),
      awful.titlebar.widget.stickybutton   (c),
      awful.titlebar.widget.ontopbutton    (c),
      awful.titlebar.widget.closebutton    (c),
      layout = wibox.layout.fixed.horizontal()
    },
    layout = wibox.layout.align.horizontal
  }
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
  c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

-- Gaps
beautiful.useless_gap = 5

-- Autostat
awful.spawn.with_shell("nitrogen --set-zoom-fill --random $HOME/img/backgrounds")
awful.spawn.with_shell("picom")
awful.spawn.with_shell("xset s off")
awful.spawn.with_shell("xset -dpms")
awful.spawn.with_shell("pgrep -u $UID -nf clipmenud || clipmenud &")
