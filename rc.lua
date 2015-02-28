-- Standard awesome library
--local gears 	= require("gears")
--local awful 	= require("awful")
--awful.rules 	= require("awful.rules")
--				  require("awful.autofocus")
--local wibox 	= require("wibox")			-- Widget and layout library
--local beautiful	= require("beautiful")			-- Theme handling library
--local naughty 	= require("naughty")			-- Notification library
--local menubar 	= require("menubar")

-- Standard awesome library
local gears 	= require("lib/gears")
local awful 	= require("lib/awful")
awful.rules 	= require("lib/awful.rules")
require("awful.autofocus")
local wibox 	= require("lib/wibox")			-- Widget and layout library
local beautiful	= require("lib/beautiful")			-- Theme handling library
local naughty 	= require("lib/naughty")			-- Notification library
local menubar 	= require("lib/menubar")

-- # User-defined libraries
local APW 		= require("apw/widget")		-- Volume indicator
local lain 		= require("lain")
local systray	= require("systray")
vicious			= require("vicious")



-- {{{ Error handling
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
                         text = err })
        in_error = false
    end)
end
-- }}}

-- Disable startup-notification globally (loading circle)
local oldspawn = awful.util.spawn
awful.util.spawn = function (s)
  oldspawn(s, false)
end

-- {{{ Run applications once on startup
function run_once(cmd)
   findme = cmd
   firstspace = cmd:find(" ")
   if firstspace then
      findme = cmd:sub(0, firstspace-1)
   end
   awful.util.spawn_with_shell("pgrep -u $USER -x " .. findme .. " > /dev/null || (" .. cmd .. ")")
end
-- }}}

-- {{{ Autostart applications
run_once("nm-applet &")
run_once("conky -c ~/.conky/conky.conf &")
run_once("ibus-daemon &")
run_once("firefox &", "startup_instance", nil, 1)
--run_once("skype &")
run_once("pidgin &")
run_once("owncloud-client &")

awful.util.spawn_with_shell("xscreensaver -nosplash &")
awful.util.spawn_with_shell("compton -b &") -- -c for shadows
--awful.util.spawn_with_shell("xcompmgr -cF &")
awful.util.spawn_with_shell("sudo hdparm -B 254 /dev/sda &")
--os.execute("hdparm -B 254 /dev/sda &")
-- }}}

-- {{{ Variable definitions

-- # Theme directory
beautiful.init(awful.util.getdir("config") .. "/themes/blackbody/theme.lua")	--default theme, as of now:customized

-- # Common
modkey 			= "Mod4"							-- Default modkey.
terminal 		= "xfce4-terminal"					--default terminal
editor 			= os.getenv("EDITOR") or "nano"
editor_cmd 		= terminal .. " -e " .. editor

-- # Table of layouts to cover with awful.layout.inc, order matters.
local layouts =
{
--        lain.layout.termfair,
  --      lain.layout.centerfair,
    --    lain.layout.cascade,
      --  lain.layout.cascadetile,
        --lain.layout.centerwork,
        --lain.layout.uselessfair,
        --lain.layout.uselesspiral,
        --lain.layout.uselesstile,
    awful.layout.suit.floating,			--1
    awful.layout.suit.tile,			--2
    awful.layout.suit.tile.left,		--3
    awful.layout.suit.tile.bottom,		--4
    awful.layout.suit.tile.top,			--5
    awful.layout.suit.fair,			--6
    awful.layout.suit.fair.horizontal,		--7
    awful.layout.suit.spiral,			--8
    awful.layout.suit.spiral.dwindle,		--9
    awful.layout.suit.max,			--10
    awful.layout.suit.max.fullscreen,		--11
    awful.layout.suit.magnifier			--12
}
-- }}}

-- {{{ Wallpaper
if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end
-- }}}




-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {
	names = { "| cmd  |", "| web  |", "|  im  |", "|office|" },--"α","β","γ","δ"},
	layout	= { 	layouts[2], layouts[10], layouts[2], layouts[2]	},
	icons = {	"/home/philipp/.config/awesome/themes/blackbody/icons/cmd.png",
				"/home/philipp/.config/awesome/themes/blackbody/icons/web.png",
				"/home/philipp/.config/awesome/themes/blackbody/icons/im.png",
				"/home/philipp/.config/awesome/themes/blackbody/icons/office.png"}
	}
    -- Each screen has its own tag table.
for s = 1, screen.count() do
  tags[s] = awful.tag(tags.names, s, tags.layout)

  for i, t in ipairs(tags[s]) do
      awful.tag.seticon(tags.icons[i], t)
      awful.tag.setproperty(t, "icon_only", 1)
  end
end


-- {{{ Tags /// changes the name and layout per tag
--tags 	= {
--   names	= { 	"| cmd  |", "| web  |", "|  im  |", "|office|" }, --" cmd ", " web ", " im ", " office " }, -- for now 4 tags is sufficient, dynamic tagging enabled; more can be added using modkey+Shift+n
--   layout	= { 	layouts[2], layouts[10], layouts[2], layouts[2]	}
--}
--for s = 1, screen.count() do
--		tags[s] = awful.tag(tags.names, s, tags.layout)
----	tags[s] = awful.tag({ 1, 2, 3, 4, 5, 6, 7, 8, 9 }, s, layouts[1]) --default: no labels, 1 layout for all
--end
--}}}

-- {{{ Menu
-- Create a laucher widget and a main menu
myawesomemenu = {
   --{ "manual", terminal .. " -e man awesome" },
   --{ "edit config", editor_cmd .. " " .. awesome.conffile },
   --{ "restart", awesome.restart },
   --{ "quit", awesome.quit }
		{ "terminal", terminal },
		{ "task manager", "lxtask" },
		{ "firefox", "firefox" },
		{ "explorer", "nemo" },
        { "spin down HDD", "hdparm -B 254 /dev/sda" },

}

mymainmenu = awful.menu({ items = { 	{ "launch", myawesomemenu, beautiful.awesome_icon },
					--{ "terminal", terminal },
					--{ "task manager", "lxtask" },
					--{ "firefox", "firefox" },
					--{ "explorer", "nemo" },
                  	--{ "spin down HDD", "hdparm -B 254 /dev/sda" },
                  	{ "restart awesome", awesome.restart },
					{ "quit awesome", awesome.quit },
                  	{ "reboot", "reboot" },
					{ "shutdown", "poweroff" },
				
				                                 }
                        })
icon = wibox.widget.imagebox()
icon:set_image(beautiful.arch)

mylauncher = awful.widget.launcher({	image = beautiful.powerbutton, --arch_icon,
										menu = mymainmenu })                             

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

--################################################WIDGETS#######################################################

-- {{{ Wibox

-- # lain markup
markup      = lain.util.markup
blue  		= beautiful.fg_focus
red   		= "#EB8F8F"
green 		= "#00CC66" --"#8FEB8F"
yellow 		= "#DBA600" --"#8FEB8F"
orange 		= "#FF3300" --"#8FEB8F"

-- # Naughty Notification Settings
naughty.config.presets.low.icon_size		= 128--256 			-- set icon-size for notifications
naughty.config.presets.low.width			= 400
naughty.config.presets.low.margin			= 5
naughty.config.defaults.margin				= 25
naughty.config.defaults.fg					= '#DEDEDE'		--#2b2233' or beautiful.fg_focus
naughty.config.defaults.bg					= '#2B292E'		--#C2C2C2'	or beautiful.bg_focus
naughty.config.defaults.border_width		= 0
naughty.config.defaults.border_color		= '#2B292E'
naughty.config.defaults.hover_timeout    	= nil
naughty.config.defaults.position			= "top_center"
naughty.config.presets.normal.opacity 		= 0.9
naughty.config.presets.low.opacity 			= 0.9
naughty.config.presets.critical.opacity 	= 0.9
--naughty.config.defaults.font				= beautiful.font or "Verdana 8"
--naughty.config.defaults.screen			= 1
--naughty.config.presets.critical.icon_size	= 64
--naughty.config.defaults.height			= 16
--naughty.config.paddingx					= 500


-- # Create a textclock widget
-- mytextclock = awful.widget.textclock()
--clockicon = wibox.widget.imagebox(beautiful.widget_clock)
-- mytextclock = awful.widget.textclock(markup("#7788af", "%A %d %B ") .. markup("#343639", ">") .. markup("#00FFFF", " %H:%M ")) --de5e1e orange, %D: MM/DD/YYYY
mytextclock = awful.widget.textclock(markup.font("Helvetica Neue-Medium 9", --markup("#2b2233", " %a "--%m/%d ") .. markup("#2b2233", "") .. 
markup("#7788af", "%R %p "))) --de5e1e orange %b/%d/%y for dec/01/14

-- # Calendar
lain.widgets.calendar:attach(mytextclock, { font_size = 8 })

-- # Battery {{
markup = lain.util.markup
baticon = wibox.widget.imagebox(beautiful.bat)
batbar = awful.widget.progressbar()
batbar:set_color(beautiful.fg_normal)
batbar:set_width(17) --18
batbar:set_ticks(false)
batbar:set_ticks_size(2)
batbar:set_background_color(beautiful.bg_normal)
batbar:buttons (awful.util.table.join (
          awful.button ({}, 3, function()
            awful.util.spawn("lxtask", false)
          end)  ))
batbar.tooltip = awful.tooltip({ objects = { batbar } })
baticon.tooltip = awful.tooltip({ objects = { baticon } })
batmargin = wibox.layout.margin(batbar, 2, 7)
batmargin:set_top(7)
batmargin:set_bottom(7)
batupd = lain.widgets.bat({
    settings = function()
        if bat_now.perc == "N/A" then
            bat_perc = 100
            batbar.tooltip:set_text (" no battery present ")
            --baticon:set_image(beautiful.ac)
        elseif bat_now.status == "Discharging" then
            bat_perc = tonumber(bat_now.perc)
            batbar.tooltip:set_text (" " .. bat_now.perc .. " % ... discharging")
            baticon.tooltip:set_text (" " .. bat_now.perc .. " % ... discharging")
            baticon:set_image(beautiful.xx)
            --if bat_perc >= 97 then
              --  batbar:set_color(green)
            --elseif bat_perc > 60 then
              --  batbar:set_color(beautiful.fg_normal)
                --baticon:set_image(beautiful.bat)
            --elseif bat_perc > 30 then
              --  batbar:set_color(yellow)
                --baticon:set_image(beautiful.bat)
            --elseif bat_perc > 15 then
              --  batbar:set_color(orange)
               -- baticon:set_image(beautiful.bat_low)
            --else
              --  batbar:set_color(red)
               -- baticon:set_image(beautiful.bat_no)
            if bat_perc == 0 then -- before 0 vol_no; 0-50 vol_low; 50-96 vol
        baticon:set_image(beautiful.bat_000)
    elseif bat_perc <= 2.5 then
        baticon:set_image(beautiful.bat_001)
 elseif bat_perc <= 5 then
        baticon:set_image(beautiful.bat_002)
 elseif bat_perc <= 7.5 then
        baticon:set_image(beautiful.bat_003)
 elseif bat_perc <= 10 then
        baticon:set_image(beautiful.bat_004)
 elseif bat_perc <= 12.5 then
        baticon:set_image(beautiful.bat_005)
 elseif bat_perc <= 15 then
        baticon:set_image(beautiful.bat_006)
 elseif bat_perc <= 17.5 then
        baticon:set_image(beautiful.bat_007)
 elseif bat_perc <= 20 then
        baticon:set_image(beautiful.bat_008)
 elseif bat_perc <= 22.5 then
        baticon:set_image(beautiful.bat_009)
 elseif bat_perc <= 25 then
        baticon:set_image(beautiful.bat_010)
 elseif bat_perc <= 27.5 then
        baticon:set_image(beautiful.bat_011)
 elseif bat_perc <= 30 then
        baticon:set_image(beautiful.bat_012)
 elseif bat_perc <= 32.5 then
        baticon:set_image(beautiful.bat_013)
 elseif bat_perc <= 35 then
        baticon:set_image(beautiful.bat_014)
 elseif bat_perc <= 37.5 then
        baticon:set_image(beautiful.bat_015)
 elseif bat_perc <= 40 then
        baticon:set_image(beautiful.bat_016)
 elseif bat_perc <= 42.5 then
        baticon:set_image(beautiful.bat_017)
 elseif bat_perc <= 45 then
        baticon:set_image(beautiful.bat_018)
 elseif bat_perc <= 47.5 then
        baticon:set_image(beautiful.bat_019)
 elseif bat_perc <= 50 then
        baticon:set_image(beautiful.bat_020)
 elseif bat_perc <= 52.5 then
        baticon:set_image(beautiful.bat_021)
 elseif bat_perc <= 55 then
        baticon:set_image(beautiful.bat_022)
 elseif bat_perc <= 57.5 then
        baticon:set_image(beautiful.bat_023)
 elseif bat_perc <= 60 then
        baticon:set_image(beautiful.bat_024)
 elseif bat_perc <= 62.5 then
        baticon:set_image(beautiful.bat_025)
 elseif bat_perc <= 65 then
        baticon:set_image(beautiful.bat_026)
 elseif bat_perc <= 67.5 then
        baticon:set_image(beautiful.bat_027)
 elseif bat_perc <= 70 then
        baticon:set_image(beautiful.bat_028)
 elseif bat_perc <= 72.5 then
        baticon:set_image(beautiful.bat_029)
 elseif bat_perc <= 75 then
        baticon:set_image(beautiful.bat_030)
 elseif bat_perc <= 77.5 then
        baticon:set_image(beautiful.bat_031)
 elseif bat_perc <= 80 then
        baticon:set_image(beautiful.bat_032)
 elseif bat_perc <= 82.5 then
        baticon:set_image(beautiful.bat_033)
 elseif bat_perc <= 85 then
        baticon:set_image(beautiful.bat_034)
 elseif bat_perc <= 87.5 then
        baticon:set_image(beautiful.bat_035)
 elseif bat_perc <= 90 then
        baticon:set_image(beautiful.bat_036)
 elseif bat_perc <= 92.5 then
        baticon:set_image(beautiful.bat_037)
 elseif bat_perc <= 95 then
        baticon:set_image(beautiful.bat_038)
 elseif bat_perc <= 97.5 then
        baticon:set_image(beautiful.bat_039)
    else
        baticon:set_image(beautiful.bat_040)
            
            
            end
        else
			bat_perc = tonumber(bat_now.perc)
			batbar.tooltip:set_text (" " .. bat_now.perc .. " % ... charging")
			baticon.tooltip:set_text (" " .. bat_now.perc .. " % ... charging")
            baticon:set_image(beautiful.bat)
            --if bat_perc >= 97 then
              --  batbar:set_color(green)
                --batbar.tooltip:set_text (" " .. bat_now.perc .. " % ... fully charged")
            --elseif bat_perc > 60 then
              --  batbar:set_color(beautiful.fg_normal)
                --baticon:set_image(beautiful.bat)
            --elseif bat_perc > 30 then
              --  batbar:set_color(yellow)
                --baticon:set_image(beautiful.bat)
            --elseif bat_perc > 15 then
              --  batbar:set_color(orange)
               -- baticon:set_image(beautiful.bat_low)
            --else
              --  batbar:set_color(red)
               -- baticon:set_image(beautiful.bat_no)
                        if bat_perc == 0 then -- before 0 vol_no; 0-50 vol_low; 50-96 vol
        baticon:set_image(beautiful.bat_000)
    elseif bat_perc <= 2.5 then
        baticon:set_image(beautiful.bat_001)
 elseif bat_perc <= 5 then
        baticon:set_image(beautiful.bat_002)
 elseif bat_perc <= 7.5 then
        baticon:set_image(beautiful.bat_003)
 elseif bat_perc <= 10 then
        baticon:set_image(beautiful.bat_004)
 elseif bat_perc <= 12.5 then
        baticon:set_image(beautiful.bat_005)
 elseif bat_perc <= 15 then
        baticon:set_image(beautiful.bat_006)
 elseif bat_perc <= 17.5 then
        baticon:set_image(beautiful.bat_007)
 elseif bat_perc <= 20 then
        baticon:set_image(beautiful.bat_008)
 elseif bat_perc <= 22.5 then
        baticon:set_image(beautiful.bat_009)
 elseif bat_perc <= 25 then
        baticon:set_image(beautiful.bat_010)
 elseif bat_perc <= 27.5 then
        baticon:set_image(beautiful.bat_011)
 elseif bat_perc <= 30 then
        baticon:set_image(beautiful.bat_012)
 elseif bat_perc <= 32.5 then
        baticon:set_image(beautiful.bat_013)
 elseif bat_perc <= 35 then
        baticon:set_image(beautiful.bat_014)
 elseif bat_perc <= 37.5 then
        baticon:set_image(beautiful.bat_015)
 elseif bat_perc <= 40 then
        baticon:set_image(beautiful.bat_016)
 elseif bat_perc <= 42.5 then
        baticon:set_image(beautiful.bat_017)
 elseif bat_perc <= 45 then
        baticon:set_image(beautiful.bat_018)
 elseif bat_perc <= 47.5 then
        baticon:set_image(beautiful.bat_019)
 elseif bat_perc <= 50 then
        baticon:set_image(beautiful.bat_020)
 elseif bat_perc <= 52.5 then
        baticon:set_image(beautiful.bat_021)
 elseif bat_perc <= 55 then
        baticon:set_image(beautiful.bat_022)
 elseif bat_perc <= 57.5 then
        baticon:set_image(beautiful.bat_023)
 elseif bat_perc <= 60 then
        baticon:set_image(beautiful.bat_024)
 elseif bat_perc <= 62.5 then
        baticon:set_image(beautiful.bat_025)
 elseif bat_perc <= 65 then
        baticon:set_image(beautiful.bat_026)
 elseif bat_perc <= 67.5 then
        baticon:set_image(beautiful.bat_027)
 elseif bat_perc <= 70 then
        baticon:set_image(beautiful.bat_028)
 elseif bat_perc <= 72.5 then
        baticon:set_image(beautiful.bat_029)
 elseif bat_perc <= 75 then
        baticon:set_image(beautiful.bat_030)
 elseif bat_perc <= 77.5 then
        baticon:set_image(beautiful.bat_031)
 elseif bat_perc <= 80 then
        baticon:set_image(beautiful.bat_032)
 elseif bat_perc <= 82.5 then
        baticon:set_image(beautiful.bat_033)
 elseif bat_perc <= 85 then
        baticon:set_image(beautiful.bat_034)
 elseif bat_perc <= 87.5 then
        baticon:set_image(beautiful.bat_035)
 elseif bat_perc <= 90 then
        baticon:set_image(beautiful.bat_036)
 elseif bat_perc <= 92.5 then
        baticon:set_image(beautiful.bat_037)
 elseif bat_perc <= 95 then
        baticon:set_image(beautiful.bat_038)
 elseif bat_perc <= 97.5 then
        baticon:set_image(beautiful.bat_039)
    else
        baticon:set_image(beautiful.bat_040)            
            end
        
        end
        batbar:set_value(bat_perc / 100)
    end
})
batwidget = wibox.widget.background(batmargin)
batwidget:set_bgimage(beautiful.batwidget_bg)
--}}
			     
-- # ALSA volume bar {{
volicon = wibox.widget.imagebox(beautiful.vol)
    volicon:buttons (awful.util.table.join (
          awful.button ({}, 3, function()
            awful.util.spawn(lain.widgets.alsabar.mixer, false)
            --awful.util.spawn ("pavucontrol", false)
          end),
          awful.button ({}, 1, function()
            awful.util.spawn(string.format("amixer set %s toggle", lain.widgets.alsabar.channel), false)
            lain.widgets.alsabar.update()
            --volume.update()
            --volume.notify()
          end),
          awful.button ({}, 4, function()
            awful.util.spawn(string.format("amixer set %s %s+", lain.widgets.alsabar.channel, lain.widgets.alsabar.step), false)
            lain.widgets.alsabar.update()
            --volume.update()
            --volume.notify()
          end),
          awful.button ({}, 5, function()
            awful.util.spawn(string.format("amixer set %s %s-", lain.widgets.alsabar.channel, lain.widgets.alsabar.step), false)
            lain.widgets.alsabar.update()
            --volume.update()
            --volume.notify()
          end)
    ))
volicon.tooltip = awful.tooltip({ objects = { volicon } })
volume = lain.widgets.alsabar({
vertical = false,
width = 40, --55,
ticks = true, 
ticks_size = 5, --6,
timeout = 0.1,
settings = function()
    if volume_now.status == "off" then
        volicon:set_image(beautiful.c_mute)
    elseif volume_now.level == 0 then -- before 0 vol_no; 0-50 vol_low; 50-96 vol
        volicon:set_image(beautiful.c_000)
    elseif volume_now.level <= 2.5 then
        volicon:set_image(beautiful.c_001)
 elseif volume_now.level <= 5 then
        volicon:set_image(beautiful.c_002)
 elseif volume_now.level <= 7.5 then
        volicon:set_image(beautiful.c_003)
 elseif volume_now.level <= 10 then
        volicon:set_image(beautiful.c_004)
 elseif volume_now.level <= 12.5 then
        volicon:set_image(beautiful.c_005)
 elseif volume_now.level <= 15 then
        volicon:set_image(beautiful.c_006)
 elseif volume_now.level <= 17.5 then
        volicon:set_image(beautiful.c_007)
 elseif volume_now.level <= 20 then
        volicon:set_image(beautiful.c_008)
 elseif volume_now.level <= 22.5 then
        volicon:set_image(beautiful.c_009)
 elseif volume_now.level <= 25 then
        volicon:set_image(beautiful.c_010)
 elseif volume_now.level <= 27.5 then
        volicon:set_image(beautiful.c_011)
 elseif volume_now.level <= 30 then
        volicon:set_image(beautiful.c_012)
 elseif volume_now.level <= 32.5 then
        volicon:set_image(beautiful.c_013)
 elseif volume_now.level <= 35 then
        volicon:set_image(beautiful.c_014)
 elseif volume_now.level <= 37.5 then
        volicon:set_image(beautiful.c_015)
 elseif volume_now.level <= 40 then
        volicon:set_image(beautiful.c_016)
 elseif volume_now.level <= 42.5 then
        volicon:set_image(beautiful.c_017)
 elseif volume_now.level <= 45 then
        volicon:set_image(beautiful.c_018)
 elseif volume_now.level <= 47.5 then
        volicon:set_image(beautiful.c_019)
 elseif volume_now.level <= 50 then
        volicon:set_image(beautiful.c_020)
 elseif volume_now.level <= 52.5 then
        volicon:set_image(beautiful.c_021)
 elseif volume_now.level <= 55 then
        volicon:set_image(beautiful.c_022)
 elseif volume_now.level <= 57.5 then
        volicon:set_image(beautiful.c_023)
 elseif volume_now.level <= 60 then
        volicon:set_image(beautiful.c_024)
 elseif volume_now.level <= 62.5 then
        volicon:set_image(beautiful.c_025)
 elseif volume_now.level <= 65 then
        volicon:set_image(beautiful.c_026)
 elseif volume_now.level <= 67.5 then
        volicon:set_image(beautiful.c_027)
 elseif volume_now.level <= 70 then
        volicon:set_image(beautiful.c_028)
 elseif volume_now.level <= 72.5 then
        volicon:set_image(beautiful.c_029)
 elseif volume_now.level <= 75 then
        volicon:set_image(beautiful.c_030)
 elseif volume_now.level <= 77.5 then
        volicon:set_image(beautiful.c_031)
 elseif volume_now.level <= 80 then
        volicon:set_image(beautiful.c_032)
 elseif volume_now.level <= 82.5 then
        volicon:set_image(beautiful.c_033)
 elseif volume_now.level <= 85 then
        volicon:set_image(beautiful.c_034)
 elseif volume_now.level <= 87.5 then
        volicon:set_image(beautiful.c_035)
 elseif volume_now.level <= 90 then
        volicon:set_image(beautiful.c_036)
 elseif volume_now.level <= 92.5 then
        volicon:set_image(beautiful.c_037)
 elseif volume_now.level <= 95 then
        volicon:set_image(beautiful.c_038)
 elseif volume_now.level <= 97.5 then
        volicon:set_image(beautiful.c_039)
    else
        volicon:set_image(beautiful.c_040)
    end
    if volume_now.status == "off" then
	volicon.tooltip:set_text ("Master: " .. volume_now.level .. "% [Muted]")
	else
	volicon.tooltip:set_text ("Master: " .. volume_now.level .. "% ")
    end
   end,
colors =
{
    background = beautiful.bg_normal,
    mute = red,
    unmute = beautiful.fg_normal
}})
volmargin = wibox.layout.margin(volume.bar, 2, 7)
volmargin:set_top(6)
volmargin:set_bottom(6)
volumewidget = wibox.widget.background(volmargin)
volumewidget:set_bgimage(beautiful.widget_bg)
--}}

-- # Separators
first = wibox.widget.textbox('<span font="Helvetica Neue 10"> </span>')
arrl_pre = wibox.widget.imagebox()
arrl_pre:set_image(beautiful.arrl_lr_pre)
arrl_pre_light = wibox.widget.imagebox()
arrl_pre_light:set_image(beautiful.arrl_lr_pre_light)
arrl_post = wibox.widget.imagebox()
arrl_post:set_image(beautiful.arrl_lr_post)
arrl_post_light = wibox.widget.imagebox()
arrl_post_light:set_image(beautiful.arrl_lr_post_light)

--############################################DONT TOUCH##########################################

-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    --awful.button({ }, 1, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
                    --awful.button({ }, 3, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  -- Without this, the following
                                                  -- :isvisible() makes no sense
                                                  c.minimized = false
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({
                                                      theme = { width = 250 }
                                                  })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons) -- put awful.widget.taglist.filter.sel to only display active tag

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

--#############################################WIDGETS IN WIBOX##################################################

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", height = "20", screen = s, border_width = 0})
  
    -- Widgets that are aligned to the left
    local left_layout = wibox.layout.fixed.horizontal()
	--left_layout:add(first)
	--left_layout:add(first)
	left_layout:add(first)
	--left_layout:add(mylauncher)
	--left_layout:add(first)
    left_layout:add(mytaglist[s])
    left_layout:add(mypromptbox[s])
    
    --left_layout:add(arrl_pre)
    --left_layout:add(mylayoutbox[s])
    --left_layout:add(arrl_post)
    left_layout:add(first)

    -- Widgets that are aligned to the right
    local right_layout = wibox.layout.fixed.horizontal()
	right_layout:add(first)
	--	if s == 1 then right_layout:add(wibox.widget.systray()) end
	right_layout:add(arrl_pre_light)
    if s == 1 then right_layout:add(systray()) end
    right_layout:add(arrl_post_light)
    right_layout:add(first)
    right_layout:add(volicon)
    --right_layout:add(volumewidget)
    right_layout:add(first)
    --right_layout:add(batwidget)
    right_layout:add(baticon)
    right_layout:add(mylayoutbox[s])
    right_layout:add(first)
    --right_layout:add(mytaglist[s])
    right_layout:add(mytextclock)
	right_layout:add(mylauncher)

    -- right_layout:add(alsawidget.bar) -- This is the old Alsa Widget; can be placed vertically
    --right_layout:add(arrl_pre)
    --right_layout:add(arrl_post)
    --right_layout:add(arrl_pre_light)
    --right_layout:add(wibox.widget.systray())
    --right_layout:add(arrl_post_light)
    --right_layout:add(APW)
    --right_layout:add(clockicon)
    --right_layout:add(mylayoutbox[s]) -- tiling & floating options

    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_middle(mytasklist[s])
    layout:set_right(right_layout)
    
    --local systray_margin = wibox.layout.margin()
    --systray_margin:set_margins(1)
    --systray_margin:set_widget(layout)

    mywibox[s]:set_widget(layout)
end
-- }}}

--###############################################KEY BINDINGS###################################################

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
		awful.button({ }, 3, function () mymainmenu:toggle() end),
		awful.button({ }, 4, awful.tag.viewnext),
		awful.button({ }, 5, awful.tag.viewprev)
				  ))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
--	awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
--	awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
	
	awful.key({ modkey,           }, "Left",   
	function ()
				awful.tag.viewprev()
				local screen = mouse.screen
				local workspace = awful.tag.selected(1).name
				self_id = naughty.notify({ 	
									replaces_id = self_id,
								preset = {
									naughty.config.presets.low,
									timeout = 0.5,
									opacity = 0.9,
									width	= 114,
									--height	= 50,
									--title = "Workspace",
									text = markup.font("Ubuntu Mono bold 12", markup("#FFA500", workspace)),
									}}).id
                  		end),    
    
    awful.key({ modkey,           }, "Right",  
    	function ()
				awful.tag.viewnext()
				local screen = mouse.screen
				local workspace = awful.tag.selected(1).name
				self_id = naughty.notify({ 	
								replaces_id = self_id,
								preset = {
									naughty.config.presets.low,
									timeout = 0.5,
									opacity = 0.9,
									width	= 114,
									--height	= 50,
									--title = "Workspace",
									text = markup.font("Ubuntu Mono bold 12", markup("#FFA500", workspace))
									}}).id
                  		end),    
                  		 		    
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "w", function () mymainmenu:show() end),

-- # Custom Key bindings
	awful.key({ }, "XF86AudioPlay", function () awful.util.spawn_with_shell("banshee --hide --toggle-playing") end),
	awful.key({ }, "XF86AudioStop", function () awful.util.spawn_with_shell("banshee --hide --stop") end),
	awful.key({ }, "XF86AudioPrev", function () awful.util.spawn_with_shell("banshee --hide --previous") end),
	awful.key({ }, "XF86AudioNext", function () awful.util.spawn_with_shell("banshee --hide --next") end),   
	awful.key({ }, "XF86MonBrightnessDown", function () awful.util.spawn("xbacklight -dec 15", false) end),
	awful.key({ }, "XF86MonBrightnessUp", function () awful.util.spawn("xbacklight -inc 15", false) end),
	
-- # taskmanager
	awful.key({ "Control", "Shift" }, "Escape", function () awful.util.spawn_with_shell("lxtask") end),

-- # nemo
	awful.key({ modkey,			}, "e", function () awful.util.spawn_with_shell("nemo", false) end),

-- # screenshot; scrot needs to be installed
	awful.key({ }, "Print", function () awful.util.spawn("scrot -e 'mv $f ~/Pictures/Screenshots/ 2>/dev/null'", false) end),

-- # output on additional screen
	awful.key({ modkey }, "F3" , function () awful.util.spawn("xrandr --output LVDS1 --mode 1366x768 --output VGA1 --mode 1440x900 --right-of LVDS1", false) end),
	awful.key({ modkey, "Shift" }, "F3" , function () awful.util.spawn("xrandr --output VGA1 --off", false) end),

-- # dynamic tagging
	awful.key({ modkey, "Shift" }, "n", function () lain.util.add_tag(mypromptbox) end),
	awful.key({ modkey, "Shift" }, "r", function () lain.util.rename_tag(mypromptbox) end),
	awful.key({ modkey, "Shift" }, "Left", function () lain.util.move_tag(1) end),  -- move to next tag
	awful.key({ modkey, "Shift" }, "Right", function () lain.util.move_tag(-1) end), -- move to previous tag
	awful.key({ modkey, "Shift" }, "d", function () lain.util.remove_tag() end),

-- # ALSA volume control
    awful.key({ }, "XF86AudioRaiseVolume",
        function ()
            awful.util.spawn("amixer set Master 2%+", false)
            --awful.util.spawn("amixer -q set " .. volume.channel .. " " .. volume.step .. "+", false)
            volume.update()
            volume.notify()
        end),
 awful.key({ }, "XF86AudioLowerVolume",
        function ()
            awful.util.spawn("amixer set Master 2%-", false)
            --awful.util.spawn("amixer -q set " .. volume.channel .. " " .. volume.step .. "-", false)
            volume.update()
            volume.notify()
        end),
 awful.key({ }, "XF86AudioMute",
        function ()
            awful.util.spawn("amixer -q set " .. volume.channel .. " playback toggle", false)
            volume.update()
            volume.notify()
        end),

-- # Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

-- # Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    awful.key({ modkey, "Control" }, "n", awful.client.restore),

-- # Prompt
    awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end),
              
-- # Menubar
    awful.key({ modkey }, "p", function() menubar.show() end)
)

clientkeys = awful.util.table.join(

-- # toggle titlebar/wibox
	awful.key({ modkey, "Shift" }, "t", awful.titlebar.toggle),
	awful.key({ }, "Menu", function ()
		mywibox[mouse.screen].visible = not mywibox[mouse.screen].visible
		end),

    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey,			  }, "q",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

--##############################################DONT TOUCH####################################################
-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = awful.util.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        local tag = awful.tag.gettags(screen)[i]
                        if tag then
                           awful.tag.viewonly(tag)
                        end
                  end),
        -- Toggle tag.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      local tag = awful.tag.gettags(screen)[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = awful.tag.gettags(client.focus.screen)[i]
                          if tag then
                              awful.client.movetotag(tag)
                          end
                     end
                  end),
        -- Toggle tag.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = awful.tag.gettags(client.focus.screen)[i]
                          if tag then
                              awful.client.toggletag(tag)
                          end
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

--###############################################RULES######################################################

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
                     --removes small gaps right/bottom in maximized terminals
                     size_hints_honor = false } },
    { rule = { class = "MPlayer" },
      properties = { floating = true } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },
    --{ rule = { class = "gimp" },
      --properties = { floating = true } },
    { rule = { class = "Gimp", role = "gimp-image-window" },
      properties = { maximized_horizontal = true,
                     maximized_vertical = true } },
    -- Set application to always map on tags number N of screen 1.
    { rule = { class = "Firefox", instance = "startup_instance" },
      properties = { tag = tags[2] } },
    { rule = { class = "Skype" },
      properties = { tag = tags[1][3] } },
    { rule = { class = "Pidgin" },
      properties = { tag = tags[1][3] } },
      -- making sure firefox's plugin-container is always on top
    { rule = { instance = "plugin-container" },
     properties = { floating = true } },
    { rule = { instance = "lxtask" },
     properties = { floating = true } },
   }
-- }}}

--#################################################DONT TOUCH####################################################

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c, startup)
    -- Enable sloppy focus
    c:connect_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end

    local titlebars_enabled = true
    if titlebars_enabled and (c.type == "normal" or c.type == "dialog") then
        -- buttons for the titlebar
        local buttons = awful.util.table.join(
                awful.button({ }, 1, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.move(c)
                end),
                awful.button({ }, 3, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.resize(c)
                end)
                )

        -- Widgets that are aligned to the left
        local left_layout = wibox.layout.fixed.horizontal()
        left_layout:add(awful.titlebar.widget.iconwidget(c))
        left_layout:buttons(buttons)

        -- Widgets that are aligned to the right
        local right_layout = wibox.layout.fixed.horizontal()
        right_layout:add(awful.titlebar.widget.floatingbutton(c))
        right_layout:add(awful.titlebar.widget.maximizedbutton(c))
        right_layout:add(awful.titlebar.widget.stickybutton(c))
        right_layout:add(awful.titlebar.widget.ontopbutton(c))
        right_layout:add(awful.titlebar.widget.closebutton(c))

        -- The title goes in the middle
        local middle_layout = wibox.layout.flex.horizontal()
        local title = awful.titlebar.widget.titlewidget(c)
        title:set_align("center")
        middle_layout:add(title)
        middle_layout:buttons(buttons)

        -- Now bring it all together
        local layout = wibox.layout.align.horizontal()
        layout:set_left(left_layout)
        layout:set_right(right_layout)
        layout:set_middle(middle_layout)

        awful.titlebar(c):set_widget(layout)
--	awful.titlebar.hide(c)
       
-- show titlebar only on specific tags
       
        local tagName = awful.tag.selected(1).name
		if tagName == "float" then 
		awful.titlebar.show(c)
		else
		awful.titlebar.hide(c)
		end
    end
end)

client.connect_signal("focus", function(c) c.border_color = 
beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
