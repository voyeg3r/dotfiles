-- File: /data/data/com.termux/files/home/.dotfiles/algorithm/lua/theme.lua
-- Last Change: Sun, Dec 2023/12/03 - 08:47:13

-- change nvim color based on hour


function isDayOrNight()
  -- Get the current time
  local currentTime = os.date("*t")

  -- Extract the hour from the current time
  local currentHour = currentTime.hour

  -- Define the hours that represent daytime
  local startDaytimeHour = 6
  local endDaytimeHour = 18

  -- Check if the current hour is within the daytime range
  if currentHour >= startDaytimeHour and currentHour < endDaytimeHour then
    -- return "day"
    return "OceanicNextLight"
  else
    -- return "night"
     return "tokyonight"
  end
end

local colorscheme = isDayOrNight()
-- vim.notify("Selected colorscheme: " .. colorscheme) -- Debugging message

-- local colorscheme = "tokyonight"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

