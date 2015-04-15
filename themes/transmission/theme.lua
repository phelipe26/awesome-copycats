---------------------------
-- Transmission awesome theme --
---------------------------
--theme colors:
--	dark:			#141212
--	lighter dark:	#1a1a1a --262222
--	highlight main:	#2300FF	
--	highlight2:		#
--	light:			#92A1A1
--	very light:		#D4D1D1


theme = {}

theme.confdir                       = os.getenv("HOME") .. "/.config/awesome/themes/transmission"
theme.wallpaper 					= theme.confdir .. "/background.png"

theme.font							= "Cantarell 9"
--theme.taglist_font                  = "Helvetica Neue-Medium 9"

theme.fg_normal						= "#92A1A1"--2b2233"		--"#aaaaaa"
theme.bg_normal						= "#00000000" --b3"--1a1a1a"		--f0f0f0"--C2C2C2"			--"#0F0F0F" --#193535"  --#222222"  -- background of the wibox
theme.fg_focus						= "#2300FF"		--#57FEFF"  --#00FFFF"
theme.bg_focus						= "#00000000"--theme.bg_normal		--"#001414" --"#040404" --#535d6c"  -- background of focused window
theme.fg_urgent						= "#CC0000"
theme.bg_urgent						= "#ff5050"
theme.fg_minimize					= "#92A1A1"
theme.bg_minimize					= "#00000000"--theme.bg_normal  --"#0F0F0F"		--#0F2020"  --"#444444" -- background of minimized window
theme.bg_systray					= "#c5c5c5"--theme.bg_normal --"#393939"  --#525252"		--theme.bg_normal

-- {{{ Borders
theme.border_width					= 0
theme.border_normal					= "#3F3F3F00"
theme.border_focus					= "#6F6F6F00"
theme.border_marked					= "#CC939300"
-- }}}

theme.menu_submenu_icon				= theme.confdir .. "/icons/submenu.png"
theme.menu_height 					= 25
theme.menu_width  					= 150

--theme.textbox_widget_margin_top     = 1
--theme.awful_widget_height           = 14
--theme.awful_widget_margin_top       = 2

-- Display the taglist squares
--theme.taglist_squares_sel           = theme.confdir .. "/taglist/square_sel.png"
--theme.taglist_squares_unsel         = theme.confdir .. "/taglist/square_unsel.png"
theme.taglist_fg_focus				= theme.fg_focus	--"#0000CC"		--#57FEFF"  --#00FFFF"
theme.taglist_font					= "Webdings 10" --Ubuntu Mono 10"
--theme.taglist_bg_focus              = "#7F7F7F"--"png:" .. theme.confdir .. "/taglist/taglist_bg_focus.png"

--theme.taglist_fg_focus              = "#dddcff"
--theme.taglist_bg_focus              = "#121212"

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
theme.tooltip_font						= "Helvetica Neue-Medium 9"
theme.tooltip_opacity					= 0.85
theme.tooltip_fg_color					= '#DEDEDE'
theme.tooltip_bg_color					= '#2B292E'
theme.tooltip_border_width				= 0
theme.tooltip_border_color				= '#2B292E'

-- You can use your own layout icons like this:
theme.layout_fairh					= theme.confdir .. "/layouts/fairh.png"
theme.layout_fairv					= theme.confdir .. "/layouts/fairv.png"
theme.layout_floating				= theme.confdir .. "/layouts/floating.png"
theme.layout_magnifier				= theme.confdir .. "/layouts/magnifier.png"
theme.layout_max					= theme.confdir .. "/layouts/max.png"
theme.layout_fullscreen				= theme.confdir .. "/layouts/fullscreen.png"
theme.layout_tilebottom				= theme.confdir .. "/layouts/tilebottom.png"
theme.layout_tileleft				= theme.confdir .. "/layouts/tileleft.png"
theme.layout_tile					= theme.confdir .. "/layouts/tile.png"
theme.layout_tiletop				= theme.confdir .. "/layouts/tiletop.png"
theme.layout_spiral					= theme.confdir .. "/layouts/spiral.png"
theme.layout_dwindle				= theme.confdir .. "/layouts/dwindle.png"
theme.arch_icon 					= theme.confdir .. "/icons/arch_bw.png"
theme.powerbutton 					= theme.confdir .. "/icons/powerbutton.png"
--theme.awesome_icon 					= "/usr/share/awesome/icons/awesome16.png"

theme.widget_bg                     = theme.confdir .. "/icons/widget_bg.png"
theme.batwidget_bg                  = theme.confdir .. "/icons/batwidget_bg.png"

-- theme.widget_batt				= theme.confdir .. "/icons/bat.png"
--theme.widget_clock					= theme.confdir .. "/icons/clock.png"
--theme.widget_vol					= theme.confdir .. "/icons/spkr.png"
theme.widget_ac						= theme.confdir .. "/icons/ac.png"
theme.widget_battery				= theme.confdir .. "/icons/battery.png"
theme.widget_battery_low			= theme.confdir .. "/icons/battery_low.png"
theme.widget_battery_empty			= theme.confdir .. "/icons/battery_empty.png"
theme.widget_vol					= theme.confdir .. "/icons/vol.png"
theme.widget_vol_low				= theme.confdir .. "/icons/vol_low.png"
theme.widget_vol_no					= theme.confdir .. "/icons/vol_no.png"
theme.widget_vol_mute				= theme.confdir .. "/icons/vol_mute.png"


theme.c_mute			= theme.confdir .. "/vol_circle/tray/mute.png"
theme.c_000				= theme.confdir .. "/vol_circle/tray/000.png"
theme.c_001				= theme.confdir .. "/vol_circle/tray/001.png"
theme.c_002				= theme.confdir .. "/vol_circle/tray/002.png"
theme.c_003				= theme.confdir .. "/vol_circle/tray/003.png"
theme.c_004				= theme.confdir .. "/vol_circle/tray/004.png"
theme.c_005				= theme.confdir .. "/vol_circle/tray/005.png"
theme.c_006				= theme.confdir .. "/vol_circle/tray/006.png"
theme.c_007				= theme.confdir .. "/vol_circle/tray/007.png"
theme.c_008				= theme.confdir .. "/vol_circle/tray/008.png"
theme.c_009				= theme.confdir .. "/vol_circle/tray/009.png"
theme.c_010				= theme.confdir .. "/vol_circle/tray/010.png"
theme.c_011				= theme.confdir .. "/vol_circle/tray/011.png"
theme.c_012				= theme.confdir .. "/vol_circle/tray/012.png"
theme.c_013				= theme.confdir .. "/vol_circle/tray/013.png"
theme.c_014				= theme.confdir .. "/vol_circle/tray/014.png"
theme.c_015				= theme.confdir .. "/vol_circle/tray/015.png"
theme.c_016				= theme.confdir .. "/vol_circle/tray/016.png"
theme.c_017				= theme.confdir .. "/vol_circle/tray/017.png"
theme.c_018				= theme.confdir .. "/vol_circle/tray/018.png"
theme.c_019				= theme.confdir .. "/vol_circle/tray/019.png"
theme.c_020				= theme.confdir .. "/vol_circle/tray/020.png"
theme.c_021				= theme.confdir .. "/vol_circle/tray/021.png"
theme.c_022				= theme.confdir .. "/vol_circle/tray/022.png"
theme.c_023				= theme.confdir .. "/vol_circle/tray/023.png"
theme.c_024				= theme.confdir .. "/vol_circle/tray/024.png"
theme.c_025				= theme.confdir .. "/vol_circle/tray/025.png"
theme.c_026				= theme.confdir .. "/vol_circle/tray/026.png"
theme.c_027				= theme.confdir .. "/vol_circle/tray/027.png"
theme.c_028				= theme.confdir .. "/vol_circle/tray/028.png"
theme.c_029				= theme.confdir .. "/vol_circle/tray/029.png"
theme.c_030				= theme.confdir .. "/vol_circle/tray/030.png"
theme.c_031				= theme.confdir .. "/vol_circle/tray/031.png"
theme.c_032				= theme.confdir .. "/vol_circle/tray/032.png"
theme.c_033				= theme.confdir .. "/vol_circle/tray/033.png"
theme.c_034				= theme.confdir .. "/vol_circle/tray/034.png"
theme.c_035				= theme.confdir .. "/vol_circle/tray/035.png"
theme.c_036				= theme.confdir .. "/vol_circle/tray/036.png"
theme.c_037				= theme.confdir .. "/vol_circle/tray/037.png"
theme.c_038				= theme.confdir .. "/vol_circle/tray/038.png"
theme.c_039				= theme.confdir .. "/vol_circle/tray/039.png"
theme.c_040				= theme.confdir .. "/vol_circle/tray/040.png"

theme.bat_000				= theme.confdir .. "/bat_circle/tray/000.png"
theme.bat_001				= theme.confdir .. "/bat_circle/tray/001.png"
theme.bat_002				= theme.confdir .. "/bat_circle/tray/002.png"
theme.bat_003				= theme.confdir .. "/bat_circle/tray/003.png"
theme.bat_004				= theme.confdir .. "/bat_circle/tray/004.png"
theme.bat_005				= theme.confdir .. "/bat_circle/tray/005.png"
theme.bat_006				= theme.confdir .. "/bat_circle/tray/006.png"
theme.bat_007				= theme.confdir .. "/bat_circle/tray/007.png"
theme.bat_008				= theme.confdir .. "/bat_circle/tray/008.png"
theme.bat_009				= theme.confdir .. "/bat_circle/tray/009.png"
theme.bat_010				= theme.confdir .. "/bat_circle/tray/010.png"
theme.bat_011				= theme.confdir .. "/bat_circle/tray/011.png"
theme.bat_012				= theme.confdir .. "/bat_circle/tray/012.png"
theme.bat_013				= theme.confdir .. "/bat_circle/tray/013.png"
theme.bat_014				= theme.confdir .. "/bat_circle/tray/014.png"
theme.bat_015				= theme.confdir .. "/bat_circle/tray/015.png"
theme.bat_016				= theme.confdir .. "/bat_circle/tray/016.png"
theme.bat_017				= theme.confdir .. "/bat_circle/tray/017.png"
theme.bat_018				= theme.confdir .. "/bat_circle/tray/018.png"
theme.bat_019				= theme.confdir .. "/bat_circle/tray/019.png"
theme.bat_020				= theme.confdir .. "/bat_circle/tray/020.png"
theme.bat_021				= theme.confdir .. "/bat_circle/tray/021.png"
theme.bat_022				= theme.confdir .. "/bat_circle/tray/022.png"
theme.bat_023				= theme.confdir .. "/bat_circle/tray/023.png"
theme.bat_024				= theme.confdir .. "/bat_circle/tray/024.png"
theme.bat_025				= theme.confdir .. "/bat_circle/tray/025.png"
theme.bat_026				= theme.confdir .. "/bat_circle/tray/026.png"
theme.bat_027				= theme.confdir .. "/bat_circle/tray/027.png"
theme.bat_028				= theme.confdir .. "/bat_circle/tray/028.png"
theme.bat_029				= theme.confdir .. "/bat_circle/tray/029.png"
theme.bat_030				= theme.confdir .. "/bat_circle/tray/030.png"
theme.bat_031				= theme.confdir .. "/bat_circle/tray/031.png"
theme.bat_032				= theme.confdir .. "/bat_circle/tray/032.png"
theme.bat_033				= theme.confdir .. "/bat_circle/tray/033.png"
theme.bat_034				= theme.confdir .. "/bat_circle/tray/034.png"
theme.bat_035				= theme.confdir .. "/bat_circle/tray/035.png"
theme.bat_036				= theme.confdir .. "/bat_circle/tray/036.png"
theme.bat_037				= theme.confdir .. "/bat_circle/tray/037.png"
theme.bat_038				= theme.confdir .. "/bat_circle/tray/038.png"
theme.bat_039				= theme.confdir .. "/bat_circle/tray/039.png"
theme.bat_040				= theme.confdir .. "/bat_circle/tray/040.png"


theme.vol                                       = theme.confdir .. "/icons/vol.png"
theme.vol_low                                   = theme.confdir .. "/icons/vol_low.png"
theme.vol_no                                    = theme.confdir .. "/icons/vol_no.png"
theme.vol_mute                                  = theme.confdir .. "/icons/vol_mute.png"
theme.disk                                      = theme.confdir .. "/icons/disk.png"
theme.ac                                        = theme.confdir .. "/icons/ac.png"
theme.bat                                       = theme.confdir .. "/icons/bat.png"
theme.bat_low                                   = theme.confdir .. "/icons/bat_low.png"
theme.bat_no                                    = theme.confdir .. "/icons/bat_no.png"
theme.play                                      = theme.confdir .. "/icons/play.png"
theme.pause                                     = theme.confdir .. "/icons/pause.png"


-- {{{ arrows in wibox to indicate layout
theme.arrl_lr_pre                   = theme.confdir .. "/icons/arrl_lr_pre.png"
theme.arrl_lr_pre_light             = theme.confdir .. "/icons/arrl_lr_pre_light.png"
theme.arrl_lr_post                  = theme.confdir .. "/icons/arrl_lr_post.png"
theme.arrl_lr_post_light            = theme.confdir .. "/icons/arrl_lr_post_light.png"
-- }}}
theme.tray_spacer            = theme.confdir .. "/icons/tray_spacer.png"
theme.spacer		         = theme.confdir .. "/icons/spacer.png"


-- {{{ Titlebars
theme.titlebar_bg_focus				= "#040404"
theme.titlebar_bg_normal			= "#3F3F3F"
-- }}}

-- {{{ Titlebar buttons
theme.titlebar_close_button_normal	= theme.confdir .. "/titlebar/close_normal.png"
theme.titlebar_close_button_focus	= theme.confdir .. "/titlebar/close_focus.png"

--theme.titlebar_ontop_button_normal_inactive = theme.confdir .. "/titlebar/ontop_normal_inactive.png"
--theme.titlebar_ontop_button_focus_inactive  = theme.confdir .. "/titlebar/ontop_focus_inactive.png"
--theme.titlebar_ontop_button_normal_active = theme.confdir .. "/titlebar/ontop_normal_active.png"
--theme.titlebar_ontop_button_focus_active  = theme.confdir .. "/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive	= theme.confdir .. "/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive 	= theme.confdir .. "/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active		= theme.confdir .. "/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active 		= theme.confdir .. "/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive	= theme.confdir .. "/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive	= theme.confdir .. "/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active	= theme.confdir .. "/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active		= theme.confdir .. "/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive	= theme.confdir .. "/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive	= theme.confdir .. "/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active	= theme.confdir .. "/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active	= theme.confdir .. "/titlebar/maximized_focus_active.png"
--}}}

-- Define the icon theme for application icons. If not set then the icons 
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme 					= "/home/philipp/.icons/MBuntu-OSX"

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80

--###################### Custom Stuff

--{{{ APW
--theme.apw_fg_color = {type = 'linear', from = {0, 0}, to={40,0},
--stops={{0, "#CC8888"}, {.4, "#88CC88"}, {.8, "#8888CC"}}}
--theme.apw_bg_color = "#333333"
--theme.apw_mute_fg_color = "#CC9393"
--theme.apw_mute_bg_color = "#663333"
--}}}

-- Comments/Hints

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Display the taglist squares
--theme.taglist_squares_sel   = theme.confdir .. "/taglist/squarefw.png"
--theme.taglist_squares_unsel = theme.confdir .. "/taglist/squarew.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
