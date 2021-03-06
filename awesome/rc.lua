-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Vicious --
local vicious = require("vicious")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup").widget
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

os.setlocale(os.getenv("LANG"))

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
--beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
beautiful.init(".config/awesome/themes/awnew/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "urxvt"
editor = os.getenv("EDITOR") or "gvim"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    --awful.layout.suit.tile.left,
    --awful.layout.suit.tile.bottom,
    --awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    --awful.layout.suit.spiral,
    --awful.layout.suit.spiral.dwindle,
    --awful.layout.suit.max,
    --awful.layout.suit.max.fullscreen,
    --awful.layout.suit.magnifier,
    -- awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}
-- }}}

-- {{{ Helper functions
local function client_menu_toggle_fn()
    local instance = nil

    return function ()
        if instance and instance.wibox.visible then
            instance:hide()
            instance = nil
        else
            instance = awful.menu.clients({ theme = { width = 250 } })
        end
    end
end
-- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
   { "hotkeys", function() return false, hotkeys_popup.show_help end},
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end}
}

mymainmenu = awful.menu({ items = { { " awesome", myawesomemenu, beautiful.awesome_icon },
		{ " Finam-Terminal", "wine /home/maksim/.wine/drive_c/Program\\ Files\\ \\(x86\\)/FINAM\\ Forex\\ Terminal/terminal.exe"},
		{ " RoboForex-Terminal", "wine /home/maksim/win32/drive_c/Program\\ Files\\/RoboForex\\ -\\ MetaTrader\\ 5/terminal.exe"},
		{ " Снимок экрана", 
		function() 
		   awful.util.spawn_with_shell("scrot -q100 '%d%h%Y_%H%M%S_screenshot.png' -e 'mv $f ~/screenshots/'") 
		end },
		{ " Run", "dmenu_run -i -p 'Выполнить:' -l 0 -w 1000 -h 40 -x 450 -y 400 -dim 0.6 -sb '#363636' -nf '#aaa' -sf '#fdfdfd' -fn 'Source Code Pro for Powerline:size=18'", beautiful.run_icon},
        { " open terminal", terminal },
        { " Перезагрузка", function()  awful.util.spawn_with_shell("systemctl reboot") end, beautiful.reboot_icon},
        { " Выключение", function()  awful.util.spawn_with_shell("systemctl poweroff") end, beautiful.poweroff_icon}
         }
})

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })



-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()


-- {{{ MyWidgets
-- Separator --
myseparator = wibox.widget.textbox()
myseparator:set_text("|")
myseparator:set_valign("center")
myseparator:set_align("center")

myseparatorspaces = wibox.widget.textbox()
myseparatorspaces:set_text(" | ")
myseparatorspaces:set_valign("center")
myseparatorspaces:set_align("center")




--   {{{ MyButtonApplications
atril_button = awful.widget.button({ image = beautiful.atril })
atril_button:buttons(awful.util.table.join(awful.button({ }, 1, function () awful.util.spawn_with_shell("atril") end)))

vim_button = awful.widget.button({ image = beautiful.vim })
vim_button:buttons(awful.util.table.join(awful.button({ }, 1, function () awful.util.spawn_with_shell("gvim") end)))

chromium_button = awful.widget.button({ image = beautiful.chromium })
chromium_button:buttons(awful.util.table.join(awful.button({ }, 1, function () awful.util.spawn_with_shell("chromium") end)))
--   }}}


--- NET ---
neticondown = wibox.widget.imagebox()
neticondown:set_image(beautiful.pan_net_down)
neticonup = wibox.widget.imagebox()
neticonup:set_image(beautiful.pan_net_up)

mywidgetnetdown = wibox.widget.textbox()
vicious.register(mywidgetnetdown, vicious.widgets.net, "${enp5s0 down_kb} kb", 1) 

mywidgetnetup = wibox.widget.textbox()
vicious.register(mywidgetnetup, vicious.widgets.net, "${enp5s0 up_kb} kb ", 1)



---HDD---
hddicon = wibox.widget.imagebox()
hddicon:set_image(beautiful.pan_hdd)
mywidgethdd = wibox.widget.textbox()
vicious.register(mywidgethdd, vicious.widgets.fs, "${/ used_p}% [${/ size_gb} Gb] ", 1)

local notific_hdd
mywidgethdd:connect_signal("button::release",
	-- function(widget,args)!!!
	function()
	if not notific_hdd then
		awful.spawn.easy_async([[bash -c "df -h"]],
		function(stdout, stderr, reason, exit_code)
		notific_hdd = naughty.notify{
			text = (stdout),
			timeout = 0,
		    position = "top_right",
		    font = "dejavu sans mono 12",
		    border_width = 1,
		    border_color = '#aaaaaa',
		    width = auto,
		    height = auto,
		    margin = 15,
		}
		end)
	else
		naughty.destroy(notific_hdd)
		notific_hdd = false
	end
	end
)




---Memory---
memicon = wibox.widget.imagebox()
memicon:set_image(beautiful.pan_mem)
mywidgetmem = wibox.widget.textbox()
vicious.register(mywidgetmem, vicious.widgets.mem, 
    function(widget, args)
    local text
    if args[1] > 50 then
	text = "<span color='#ffff00'>" .. args[1] .."%</span> "
    else
	text = args[1] .. "% "
    end
    return text
    end
    , 1)

--mywidgetmem:buttons(awful.button({}, 
--		    1, 
--		    function() awful.util.spawn(terminal .. " -e htop") end)
--		    )



---CPU---
cpuicon = wibox.widget.imagebox()
cpuicon:set_image(beautiful.pan_cpu)
mywidgetcpu = wibox.widget.textbox()
vicious.register(mywidgetcpu, vicious.widgets.cpu, 
    function(widget, args)
    local text
    if args[1] > 50 then
	text = "<span color='#ffff00'>" .. args[1] .."%</span> "
    else
	text = args[1] .. "% "
    end
    return text
    end
    , 1)

--- Volume ---
volicon = wibox.widget.imagebox()
volicon:set_image(beautiful.pan_vol)
volwidget = wibox.widget.textbox()
vicious.register(volwidget, vicious.widgets.volume, "$1% ", 2, "Master")
volwidget:buttons(awful.util.table.join(
    awful.button({ }, 1, function () awful.util.spawn("amixer -q set Master toggle", false) end),
    -- awful.button({ }, 3, function () awful.util.spawn("urxvt -e alsamixer", true) end),
    awful.button({ }, 4, function () awful.util.spawn("amixer -q set Master 1dB+", false) end),
    awful.button({ }, 5, function () awful.util.spawn("amixer -q set Master 1dB-", false) end)
))

--- Pkg update ---
pacwidget = wibox.widget.textbox()
pacicon = wibox.widget.imagebox()
pacicon:set_image(beautiful.pan_upd)
vicious.register(pacwidget, vicious.widgets.pkg, 
    function(widget, args)
    local text
    if args[1] > 0 then
		pacicon.visible = true
		text = "<span color='#ffff00'>" .. args[1] .. "</span> |"
		awful.util.spawn_with_shell("sudo pacman -Sy")
    else
		pacicon.visible = false
		text = ""
    end
    return text
    end
, 1800, 'Arch C')

local notific_pkg
pacwidget:connect_signal("button::release",
	-- function(widget,args)!!!
	function()
	if not notific_pkg then
		awful.spawn.easy_async([[bash -c "pacman -Qu"]],
		function(stdout, stderr, reason, exit_code)
			if stdout:len() > 0 then
			notific_pkg = naughty.notify{
			text = (stdout),
			timeout = 0,
			position = "top_right",
			font = "dejavu sans mono 12",
			border_width = 1,
			border_color = '#aaaaaa',
			height = auto,
			width = auto,
			margin = 15,
			}
			end
		end)
	else
		naughty.destroy(notific_pkg)
		notific_pkg = false
	end
	end
)
--pacicon:connect_signal() 

--- Date Time ---
mywidgetdate = wibox.widget.textbox()
vicious.register(mywidgetdate, vicious.widgets.date, "%T (%A)", 1)

local notific
mywidgetdate:connect_signal("button::release", 
    function() 
	if not notific then
	    awful.spawn.easy_async([[bash -c "ncal -C -A1 | sed 's/_.\(.\)/+\1-/g'"]],
	    function(stdout, stderr, reason, exit_code)
		notific = naughty.notify{
		    text = string.gsub(string.gsub(stdout,"+", "<span color='#ffff00'>"), "-", "</span>"),
		    timeout = 0,
		    position = "top_right",
		    font = "dejavu sans mono 12",
		    border_width = 1,
		    border_color = '#aaaaaa',
		    width = auto,
		    height = 185,
		    margin = 15,
		}
	    end)
	else
	    naughty.destroy(notific)
	    notific = false
	end

    end
)

-- }}}


-- {{{ Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock()

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
                                                  -- Without this, the following
                                                  -- :isvisible() makes no sense
                                                  c.minimized = false
                                                  if not c:isvisible() and c.first_tag then
                                                      c.first_tag:view_only()
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, client_menu_toggle_fn()),
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
	-- ➊ ➋ ➌ ➍ ➎ ➏ ➐ ➑ ➒ ➓
    -- α β γ δ ε ϛ ζ η θ ι κ λ μ ν ξ ο π Ϟ ρ σ τ υ φ χ ψ ω ϡ
	awful.tag({ "main", "code", "read", "web", "misc"}, s, 
	{awful.layout.layouts[3], 
	 awful.layout.layouts[4],
	 awful.layout.layouts[1], 
	 awful.layout.layouts[2],
	 awful.layout.layouts[1]})

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    
						   
-- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, taglist_buttons)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, tasklist_buttons)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            mylauncher,
            s.mytaglist,
            myseparatorspaces,
	    atril_button,
	    vim_button,
	    chromium_button,
	    myseparatorspaces,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
			wibox.widget.systray(),
			myseparator,
			cpuicon,
			mywidgetcpu,
			myseparator,
			memicon,
			mywidgetmem,
			myseparator,
			hddicon,
			mywidgethdd,
			myseparator,
			neticondown,
			mywidgetnetdown,
			neticonup,
			mywidgetnetup,
			myseparatorspaces,
			pacicon,
			pacwidget,
--			myseparatorspaces,
			mykeyboardlayout,
			myseparator,
			volicon,
			volwidget,
            myseparatorspaces,
            mywidgetdate,
            --mytextclock,
			myseparatorspaces,
            s.mylayoutbox,
            layout_launcher,
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

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),

    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                      client.focus = c
                      c:raise()
                  end
              end,
              {description = "restore minimized", group = "client"}),

    -- Prompt
    awful.key({ modkey },            "r",     function () awful.screen.focused().mypromptbox:run() end,
              {description = "run prompt", group = "launcher"}),

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
    awful.key({ modkey }, "p", 
			  function() 
				  --menubar.show()
				  -- dmenu2 (AUR)!!!
				  awful.util.spawn_with_shell( "dmenu_run -i -p 'Выполнить:' -l 0 -w 1000 -h 40 -x 450 -y 400 -dim 0.6 -sb '#363636' -nf '#aaa' -sf '#fdfdfd' -fn 'Source Code Pro for Powerline:size=18'" )
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
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

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
					 -- !!! size_hints_honor = false  ровные отступы от экрана
					 size_hints_honor = false,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },

    -- Floating clients.
    { rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
        },
        class = {
          "Arandr",
          "Gpick",
          "Kruler",
          "MessageWin",  -- kalarm.
          "Sxiv",
          "Wpa_gui",
          "pinentry",
          "veromix",
          "xtightvncviewer"},

        name = {
          "Event Tester",  -- xev.
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { floating = true }},

    -- Add titlebars to normal clients and dialogs
    --{ rule_any = {type = { "normal", "dialog" }
    --  }, properties = { titlebars_enabled = true }
    --},

    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { screen = 1, tag = "2" } },
    
    --Pidgin
    { rule = { class = "Pidgin" },
	properties = { screen = 1, tag = "misc" } },
	
    --Chromium
    { rule = { class = "Chromium "},
	properties = { screen = 1, tag = "web" } },
    
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup and
      not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
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
    if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
        and awful.client.focus.filter(c) then
        client.focus = c
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
