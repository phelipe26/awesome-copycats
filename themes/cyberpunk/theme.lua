---------------------------
-- Cyberpunk awesome theme --
---------------------------

theme = {}

theme.confdir                       = os.getenv("HOME") .. "/.config/awesome/themes/cyberpunk"
theme.wallpaper 					= theme.confdir .. "/background.jpg"

theme.font							= "cantarell 7"
--theme.taglist_font                  = "Icons 10"

theme.bg_normal						= "#0F0F0F" --#193535"  --#222222"
theme.bg_focus						= "#0F0F0F"		--"#001414" --"#040404" --#535d6c"
theme.bg_urgent						= "#ff0000"
theme.bg_minimize					= "#0F0F0F"		--#0F2020"  --"#444444"
theme.bg_systray					= "#1a1a1a"		--theme.bg_normal
theme.fg_normal						= "#aaaaaa"
theme.fg_focus						= "#7519FF"		--#57FEFF"  --#00FFFF"
theme.fg_urgent						= "#ffffff"
theme.fg_minimize					= "#ffffff"
-- {{{ Borders
theme.border_width					= 0
theme.border_normal					= "#3F3F3F"
theme.border_focus					= "#6F6F6F"
theme.border_marked					= "#CC9393"
-- }}}

theme.menu_submenu_icon				= theme.confdir .. "/icons/submenu.png"
theme.menu_height 					= 20
theme.menu_width  					= 115

theme.taglist_squares_sel           = theme.confdir .. "/taglist/square_sel.png"
theme.taglist_squares_unsel         = theme.confdir .. "/taglist/square_unsel.png"
--theme.taglist_fg_focus              = "#dddcff"
--theme.taglist_bg_focus              = "#121212"

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

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
theme.awesome_icon 					= "/usr/share/awesome/icons/awesome16.png"

-- theme.widget_batt				= theme.confdir .. "/icons/bat.png"
theme.widget_clock					= theme.confdir .. "/icons/clock.png"
--theme.widget_vol					= theme.confdir .. "/icons/spkr.png"
theme.widget_ac						= theme.confdir .. "/icons/ac.png"
theme.widget_battery				= theme.confdir .. "/icons/battery.png"
theme.widget_battery_low			= theme.confdir .. "/icons/battery_low.png"
theme.widget_battery_empty			= theme.confdir .. "/icons/battery_empty.png"
theme.widget_vol					= theme.confdir .. "/icons/vol.png"
theme.widget_vol_low				= theme.confdir .. "/icons/vol_low.png"
theme.widget_vol_no					= theme.confdir .. "/icons/vol_no.png"
theme.widget_vol_mute				= theme.confdir .. "/icons/vol_mute.png"

-- {{{ arrows in wibox to indicate layout
theme.arrl_lr_pre                   = theme.confdir .. "/icons/arrl_lr_pre.png"
theme.arrl_lr_post                  = theme.confdir .. "/icons/arrl_lr_post.png"
-- }}}

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
theme.icon_theme 					= nil

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
