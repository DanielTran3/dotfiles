-- Hyprland Lua config
-- Migrated from hyprland.conf (0.54 → 0.55)
-- Refer to the wiki for more information: https://wiki.hypr.land/Configuring/

-- Source theme file (replaces: source = ~/.config/hypr/themes/mocha.conf)
require("themes/mocha")

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "DP-2",
    mode     = "2560x1440@180.00Hz",
    position = "0x0",
    scale    = 1,
})

hl.monitor({
    output   = "DP-3",
    mode     = "2560x1440@165.08Hz",
    position = "2560x0",
    scale    = 1,
})

hl.monitor({
    output   = "HDMI-A-2",
    mode     = "2560x1440@120.00Hz",
    position = "auto-up",
    scale    = 1,
})

-- hl.monitor({ output = "HDMI-A-2", mode = "3840x2160@60.00Hz", position = "auto-up", scale = 1 })

-- Bind workspaces to specific monitors (replaces: wsbind=)
hl.workspace_rule({ workspace = "1", monitor = "DP-2" })
hl.workspace_rule({ workspace = "2", monitor = "HDMI-A-2" })

---------------------
---- MY PROGRAMS ----
---------------------

local terminal  = "kitty"
local fileManager = "nautilus"
-- Theme is set by default to type-1/style-6 in ~/.config/rofi/config.rasi
local menu      = "rofi -show drun"
-- Notable style: type-1/style-14. Custom setting rofi clipvault theme here
local rofiTheme = os.getenv("HOME") .. "/.config/rofi/launchers/type-1/style-14.rasi"

-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("swaync")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("hyprpaper")

    -- Clipvault settings
    hl.exec_cmd("wl-paste --type text --watch clipvault store")
    hl.exec_cmd("wl-paste --type image --watch clipvault store")
    hl.exec_cmd("wl-paste --watch clipvault store --ignore-pattern '^<meta http-equiv='")

    -- Cursor
    hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Classic'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-size 20")
    hl.exec_cmd("hyprctl setcursor Bibata-Modern-Classic 20")

    -- Remote
    hl.exec_cmd("/usr/bin/kdeconnectd")
    hl.exec_cmd("kdeconnect-indicator")

    -- Nautilus for device connection
    hl.exec_cmd("udiskie &")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
hl.env("QT_QPA_PLATFORMTHEME",  "qt6ct")
hl.env("XCURSOR_SIZE",          "20")
hl.env("HYPRCURSOR_SIZE",       "20")
hl.env("HYPRCURSOR_THEME",      "Bibata-Modern-Classic")
hl.env("XCURSOR_THEME",         "Bibata-Modern-Classic")

-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in  = 3,
        gaps_out = 8,

        border_size = 2,

        col = {
            active_border   = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = false,
        allow_tearing    = false,
        layout           = "dwindle",
    },

    decoration = {
        rounding       = 8,
        rounding_power = 2,

        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,   -- rgba(1a1a1aee)
        },

        blur = {
            enabled   = true,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

-- Bezier curves
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1} } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} } })
hl.curve("linear",         { type = "bezier", points = { {0,    0},    {1,    1} } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5,  0.5},  {0.75, 1} } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1,  1} } })

-- Animations
hl.animation({ leaf = "global",        enabled = true, speed = 10,   bezier = "default"      })
hl.animation({ leaf = "border",        enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 4.1,  bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true, speed = 3.03, bezier = "quick"        })
hl.animation({ leaf = "layers",        enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true, speed = 7,    bezier = "quick"        })

-- "Smart gaps" / "No gaps when only" — uncomment if you wish to use
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({ name = "no-gaps-wtv1", match = { float = false, workspace = "w[tv1]" }, border_size = 0, rounding = 0 })
-- hl.window_rule({ name = "no-gaps-f1",   match = { float = false, workspace = "f[1]"   }, border_size = 0, rounding = 0 })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        pseudotile    = true,   -- master switch; bound to mainMod + P below
        preserve_split = true,
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- https://wiki.hypr.land/Configuring/Basics/Variables/#misc
hl.config({
    misc = {
        force_default_wallpaper = -1,   -- set to 0 or 1 to disable anime mascot wallpapers
        disable_hyprland_logo   = false,
    },
})

---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,
        sensitivity  = 0,   -- -1.0 – 1.0, 0 means no modification

        touchpad = {
            natural_scroll = false,
        },
    },
})

-- See https://wiki.hypr.land/Configuring/Gestures/
hl.gesture({
    fingers   = 3,
    direction = "horizontal",
    action    = "workspace",
})

-- Per-device config — see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})

---------------------
---- KEYBINDINGS ----
---------------------

-- See https://wiki.hypr.land/Configuring/Basics/Binds/
local mainMod = "SUPER"   -- "Windows" key

-- Applications
hl.bind(mainMod .. " + Q",         hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + W",         hl.dsp.window.close())
hl.bind(mainMod .. " + M",         hl.dsp.exit())
hl.bind(mainMod .. " + E",         hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + D",         hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SPACE",     hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P",         hl.dsp.window.pseudo())
hl.bind(mainMod .. " + H",         hl.dsp.layout("focusmaster"))

-- Clipboard manager (clipvault + rofi)
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(
    "rofi -theme " .. rofiTheme ..
    " -modi clipboard:~/.config/rofi/clipvault_rofi.sh -show clipboard -show-icons"
))

-- Screenshots
hl.bind(mainMod .. " + S",           hl.dsp.exec_cmd('grim -g "$(slurp -o -r)" -t ppm - | satty --filename -'))
hl.bind(mainMod .. " + SHIFT + S",   hl.dsp.exec_cmd('grim -g "$(slurp)" -t ppm - | satty --filename -'))

-- Lock screen
hl.bind(mainMod .. " + CTRL + L",   hl.dsp.exec_cmd("hyprlock"))

-- Focus movement (IJKL cluster)
hl.bind(mainMod .. " + J",           hl.dsp.focus({ direction = "left"  }))
hl.bind(mainMod .. " + L",           hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + I",           hl.dsp.focus({ direction = "up"    }))
hl.bind(mainMod .. " + K",           hl.dsp.focus({ direction = "down"  }))

-- Cycle workspaces
hl.bind(mainMod .. " + TAB",         hl.dsp.exec_cmd("hypr-cycle next"))
hl.bind(mainMod .. " + SHIFT + TAB", hl.dsp.exec_cmd("hypr-cycle previous"))
hl.bind(mainMod .. " + SHIFT + Z",   hl.dsp.window.move({ workspace = "m-1" }))
hl.bind(mainMod .. " + SHIFT + X",   hl.dsp.window.move({ workspace = "m+1" }))

-- Switch workspaces 1–10 / move window to workspace 1–10
for i = 1, 10 do
    local key = i % 10   -- key 0 maps to workspace 10
    hl.bind(mainMod .. " + " .. key,           hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key,   hl.dsp.window.move({ workspace = i }))
end

-- Scroll through workspaces with mainMod + scroll wheel
hl.bind(mainMod .. " + mouse_down",  hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",    hl.dsp.focus({ workspace = "e-1" }))

-- Move / resize windows with mainMod + LMB/RMB drag
hl.bind(mainMod .. " + mouse:272",   hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273",   hl.dsp.window.resize(), { mouse = true })

-- Volume / brightness (bindel → locked + repeating)
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),  { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),        { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),       { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                    { locked = true, repeating = true })

-- Media keys (bindl → locked only)
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),        { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"),  { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"),  { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),    { locked = true })

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Ignore maximize requests from all apps
hl.window_rule({
    name          = "ignore-maximize-app-requests",
    match         = { class = "^(.*)$" },
    suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland
hl.window_rule({
    name  = "fix-dragging",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

-- Float pavucontrol under the cursor
hl.window_rule({
    name        = "float-pavucontrol",
    match       = { class = "^(org.pulseaudio.pavucontrol)$" },
    float       = true,
    size        = "420 520",
    move        = "(cursor_x-420) (cursor_y+20)",
    border_size = 0,
})

-- Float Nautilus previewer (sushi)
hl.window_rule({
    name  = "float-sushi",
    match = { class = "^(org.gnome.NautilusPreviewer)$" },
    float = true,
})
