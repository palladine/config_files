-------------------------------
--   "AwNew" awesome theme   --
-------------------------------
local awful = require("awful")

--local themes_path = require("gears.filesystem").get_themes_dir()
local themes_path = "~/.config/awesome/themes/"
local dpi = require("beautiful.xresources").apply_dpi

-- {{{ Main
local theme = {}
theme.wallpaper = themes_path .. "awnew/squares2.jpg"
-- }}}

-- {{{ Styles
theme.font      = "dejavu sans for powerline 10"

-- {{{ Colors
theme.fg_normal  = "#aaaaaa"
theme.fg_focus   = "#fdfdfd"
theme.fg_urgent  = "#fdfdfd"
theme.fg_minimize = "#fdfdfd"

theme.bg_normal  = "#363636"
theme.bg_focus   = "#363636"
theme.bg_urgent  = "#363636"
theme.bg_minimize = "#363636"
theme.bg_systray = theme.bg_normal
-- }}}

-- {{{ Borders
theme.useless_gap   = dpi(3)
theme.border_width  = dpi(2)
theme.border_normal = "#202020"
theme.border_focus  = "#202020"
theme.border_marked = "#202020"
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = "#363636"
theme.titlebar_bg_normal = "#363636"
-- }}}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
--theme.taglist_bg_focus = "#CC9393"
-- }}}

theme.taglist_bg_focus = "#363636"
theme.taglist_bg_urgent = "#252525"
theme.taglist_bg_empty = "#252525"
theme.taglist_bg_occupied = "#252525"
theme.taglist_bg_volatile = "#252525"


theme.tasklist_disable_icon = true


-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#494B4F"
--theme.border_widget    = "#3F3F3F"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#CC9393"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = dpi(18)
theme.menu_width  = dpi(200)
-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel   = themes_path .. "awnew/taglist/squarefz.png"
theme.taglist_squares_unsel = themes_path .. "awnew/taglist/squarez.png"

--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
theme.awesome_icon           = themes_path .. "awnew/common/archlinux.svg"
theme.menu_submenu_icon      = themes_path .. "awnew/common/submenu.svg"
-- }}}

-- {{{ Layout
theme.layout_tile       = themes_path .. "awnew/layouts/tile.svg"
theme.layout_tileleft   = themes_path .. "awnew/layouts/tileleft.svg"
theme.layout_tilebottom = themes_path .. "awnew/layouts/tilebottom.svg"
theme.layout_tiletop    = themes_path .. "awnew/layouts/tiletop.svg"
theme.layout_fairv      = themes_path .. "awnew/layouts/fairv.png"
theme.layout_fairh      = themes_path .. "awnew/layouts/fairh.png"
theme.layout_spiral     = themes_path .. "awnew/layouts/spiral.svg"
theme.layout_dwindle    = themes_path .. "awnew/layouts/dwindle.png"
theme.layout_max        = themes_path .. "awnew/layouts/max.svg"
theme.layout_fullscreen = themes_path .. "awnew/layouts/fullscreen.svg"
theme.layout_magnifier  = themes_path .. "awnew/layouts/magnifier.svg"
theme.layout_floating   = themes_path .. "awnew/layouts/floating.svg"
theme.layout_cornernw   = themes_path .. "awnew/layouts/cornernw.svg"
theme.layout_cornerne   = themes_path .. "awnew/layouts/cornerne.svg"
theme.layout_cornersw   = themes_path .. "awnew/layouts/cornersw.svg"
theme.layout_cornerse   = themes_path .. "awnew/layouts/cornerse.svg"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus  = themes_path .. "awnew/titlebar/close_focus.png"
theme.titlebar_close_button_normal = themes_path .. "awnew/titlebar/close_normal.png"

theme.titlebar_minimize_button_normal = themes_path .. "awnew/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path .. "awnew/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_focus_active  = themes_path .. "awnew/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = themes_path .. "awnew/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path .. "awnew/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = themes_path .. "awnew/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = themes_path .. "awnew/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = themes_path .. "awnew/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = themes_path .. "awnew/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = themes_path .. "awnew/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = themes_path .. "awnew/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = themes_path .. "awnew/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = themes_path .. "awnew/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = themes_path .. "awnew/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = themes_path .. "awnew/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = themes_path .. "awnew/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path .. "awnew/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = themes_path .. "awnew/titlebar/maximized_normal_inactive.png"
-- }}}
--
-- {{{ Applications
--theme.vbox = "~/.config/awesome/themes/mytheme/icons/virtualbox.png"
--theme.gns = "~/.config/awesome/themes/mytheme/icons/gns.png"
theme.atril = themes_path .. "awnew/icons/atril.png"
--theme.brackets = "~/.config/awesome/themes/mytheme/icons/brackets.png"
theme.vim = themes_path .. "awnew/icons/vim.png"
theme.chromium = themes_path .. "awnew/icons/chromium.png"
--theme.firefox = "~/.config/awesome/themes/mytheme/icons/firefox.png"
--theme.thunar = "~/.config/awesome/themes/mytheme/icons/thunar.png"
--theme.cmus = "~/.config/awesome/themes/mytheme/icons/cmus.png"
--theme.subl3 = "~/.config/awesome/themes/mytheme/icons/subl3.png"
--theme.teamviewer = "~/.config/awesome/themes/mytheme/icons/teamviewer.png"
--theme.emacs = "~/.config/awesome/themes/mytheme/icons/emacs.png"
-- }}}



-- {{{ Panel
    theme.pan_cpu = themes_path .. "awnew/icons/panel/cpu.png"
    theme.pan_mem = themes_path .. "awnew/icons/panel/mem.png"
    theme.pan_hdd = themes_path .. "awnew/icons/panel/hdd.png"
    theme.pan_vol = themes_path .. "awnew/icons/panel/vol.png"
---}}}
-- }}}

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
