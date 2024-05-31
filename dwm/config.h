/* See LICENSE file for copyright and license details. */
// Last Change: Fri, 27 Oct 2023 - 12:47:39
// File: /home/sergio/.dotfiles/dwm/config.h
// vim:ft=c:nolist:nospell:

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int gappx     = 6;        /* gaps between windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const Bool viewontag         = True;     /* Switch view on tag switch */
static const char *fonts[]          = { "FontAwesome:size=13", "consolas:size=10" };
static const char dmenufont[]       = "monospace:size=10";
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#444444";
static const char *colors[][3]      = {
    /*               fg         bg         border   */
    [SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
    [SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };
/*static const char *tags[] = {  "", "", "", "✅", "嗢", "", "", "", "" };*/

static const Rule rules[] = {
    /* xprop(1):
     *  WM_CLASS(STRING) = instance, class
     *  WM_NAME(STRING) = title
     */

    /* class              instance    title       tags mask     switchtotag    isfloating   monitor */
    { "Gimp",             NULL,       NULL,       0,            0,             1,           -1 },
    { "firefox",          NULL,       NULL,       2 << 0,       1,             0,           -1 },
    { "TelegramDesktop",  NULL,       NULL,       1 << 4,       1,             0,           -1 },
    { "Inkscape",         NULL,       NULL,       1 << 3,       1,             0,           -1 },
    { "ranger",           NULL,       NULL,       4 << 0,       1,             0,           -1 },
    { "ranger2",          NULL,       NULL,       1 << 0,       1,             0,           -1 },
    { "pulse",            NULL,       NULL,       0,            0,             1,           -1 },
    { "amixer",           NULL,       NULL,       0,            0,             1,           -1 },
    { "Pavucontrol",      NULL,       NULL,       0,            0,             1,           -1 },
    { "St",               NULL,       NULL,       1 << 0,       1,             0,           -1 },
    { "term2",            NULL,       NULL,       0,            0,             0,           -1 },
    { "htop",             NULL,       NULL,       0,            0,             1,           -1 },
    { "scratchpad",       NULL,       NULL,       0,            0,             1,           -1 },
    { "scratchy",         NULL,       NULL,       0,            0,             1,           -1 },
    { "nvim",             NULL,       NULL,       1 << 8,       1,             0,           -1 },
    { "newsboat",         NULL,       NULL,       1 << 5,       1,             1,           -1 },
    { "Nemo",             NULL,       NULL,       1 << 7,       1,             0,           -1 },
    { "mpv",              NULL,       NULL,       1 << 8,       1,             0,           -1 },
    { "Firefox",          "Places",   "Library",  0,            0,             1,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

#include "grid.c"
static const Layout layouts[] = {
    /* symbol     arrange function */
    { "[]=",      tile },    /* first entry is default */
    { "><>",      NULL },    /* no layout function means floating behavior */
    { "[M]",      monocle },
    { "HHH",      grid },
};

/* Focus the next workspace when a window is closed? */
/* response from bard.google.com */
// #define FOCUSED_WORKSPACE_AFTER_CLOSE 0

/* from bard.google.com
The SWAPWORKSPACESONLASTWINDOWCLOSE macro is a preprocessor directive that controls whether dwm should switch to the next active workspace when the last window in a workspace is closed. It is defined in the config.h file and should be set to 1 to enable this feature.

 * */
#define SWAPWORKSPACESONLASTWINDOWCLOSE 1

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
    { MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
    { MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
    { MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
    { MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }
#define APP_DUNSTCLOSE          "dunstctl close"

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "st", "-f", "Iosevka Mayukai Original:size=15:antialias=true:autohint=true", NULL };
static const char *term2cmd[]  = { "st", "-z", "18", "-c", "term2",  NULL };
static const char scratchpadname[] = "scratchpad";
// static const char *scratchpadcmd[] = { "st", "-c", scratchpadname, "-t", scratchpadname, "-g", "120x24", "-f", "Iosevka Mayukai Original:size=15:antialias=true:autohint=true", NULL };
static const char *rangercmd[]  = { "st", "-f", "Iosevka Mayukai Original:size=15:antialias=true:autohint=true", "-c ranger -e", "ranger" };
static const char *rangercmd2[]  = { "st", "-f", "Iosevka Mayukai Original:size=15:antialias=true:autohint=true", "-c ranger2 -e", "ranger" };
static const char *browcmd[]  = { "firefox", NULL };
static const char *nemocmd[]  = { "nemo", NULL };
static const char *htcmd[] = { "st", "-c htop -e", "htop" };
static const char *mixercmd[] = {"st", "-c pulse", "pulsemixer", NULL};
static const char *amixercmd[] = {"st", "-c amixer", "alsamixer", NULL};
static const char *lockcmd[] = {"slock", NULL};
static const char *calendarcmd[] = {"/home/sergio/.dotfiles/bin/calendar.sh", NULL};
static const char *imgcmd[] = {"/home/sergio/.dotfiles/algorithm/shell/bash/openimages.sh", NULL};
static const char *mpvcmd[] = {"/home/sergio/.dotfiles/algorithm/shell/zsh/plaympv.sh", NULL};
static const char *wikicmd[] = {"/home/sergio/.dotfiles/bin/editwiki"};
static const char *dradiocmd[] = {"/home/sergio/.dotfiles/bin/dradio", "-d", NULL};
static const char *newsboatcmd[] = { "st", "-z 18 -c newsboat -e", "newsboat"};
// static const char *rofioldcmd[] = { "/home/sergio/.dotfiles/algorithm/shell/zsh/rofi-old"};

static const char *brightup[]       = { "/home/sergio/.dotfiles/bin/changebrightness.sh", "up", NULL};
static const char *brightdown[]     = { "/home/sergio/.dotfiles/bin/changebrightness.sh", "down", NULL};

/* Add somewhere in your constants definition section
 * source: https://bitbucket.org/sergio/workspace/snippets/KMndeG
 *         https://unix.stackexchange.com/a/21090/3157

amixer set Master 10%+
amixer set Master 10%-
amixer set Master mute

/usr/bin/pactl", "set-sink-volume", "0", "+5%",     NULL
/usr/bin/pactl", "set-sink-volume", "0", "-5%",     NULL
/usr/bin/pactl", "set-sink-mute",   "0", "toggle",  NULL

*/

// static const char *upvol[]   = { "/bin/amixer", "set Master", "+5%",     NULL };
// static const char *downvol[] = { "/bin/amixer", "set Master", "-5%",     NULL };
// static const char *mutevol[] = { "/bin/amixer", "set Master", "toggle",  NULL };
// pactl set-sink-volume @DEFAULT_SINK@ +5%

// static const char *upvol[]   = { "/bin/pactl", "set-sink-volume", "@DEFAULT_SINK@", "+5%",     NULL };
// static const char *downvol[] = { "/bin/pactl", "set-sink-volume", "@DEFAULT_SINK@", "-5%",     NULL };
// static const char *mutevol[] = { "/bin/pactl", "set-sink-mute",   "@DEFAULT_SINK@", "toggle",  NULL };

static const char *upvol[]   = { "/home/sergio/.dotfiles/bin/changevolume.sh", "up",     NULL };
static const char *downvol[] = { "/home/sergio/.dotfiles/bin/changevolume.sh", "down",   NULL };
static const char *mutevol[] = { "/home/sergio/.dotfiles/bin/changevolume.sh", "mute",   NULL };
static const char *mutemic[] = { "/home/sergio/.dotfiles/bin/togglemic.sh",   NULL };

#include <X11/XF86keysym.h>
#include "focusurgent.c"
#include "shiftview.c"

static Key keys[] = {
    /* modifier                     key            function             argument */
    { 0,            XF86XK_AudioLowerVolume,       spawn,               {.v = downvol} },
    { 0,            XF86XK_AudioMute,              spawn,               {.v = mutevol }},
    { 0,            XF86XK_AudioRaiseVolume,       spawn,               {.v = upvol} },
    { 0,            XF86XK_TouchpadToggle,         spawn,               SHCMD("(synclient | grep 'TouchpadOff.*1' && synclient TouchpadOff=0) || synclient TouchpadOff=1") },
    { 0,            XF86XK_MonBrightnessUp,        spawn,               {.v = brightup } },
    { 0,            XF86XK_MonBrightnessDown,      spawn,               {.v = brightdown } },
    { ControlMask|Mod1Mask,         XK_p,          shiftviewclients,    {.i = +1} },
    { MODKEY|ShiftMask,             XK_backslash,  shiftviewclients,    {.i = -1} },
    { MODKEY,                       XK_F11,        spawn,               {.v = downvol } },
    { MODKEY,                       XK_F12,        spawn,               {.v = upvol } },
    { MODKEY|ShiftMask,             XK_F12,        spawn,               {.v = mutevol } },
    { ControlMask|Mod1Mask,         XK_i,          spawn,               {.v = imgcmd } },
    { MODKEY|Mod1Mask,              XK_m,          spawn,               {.v = mpvcmd } },
    { ControlMask,                  XK_F12,        spawn,               SHCMD("xset dpms force off")},
    { ControlMask|Mod1Mask,         XK_Escape,     spawn,               SHCMD("xkill")},
    { MODKEY,                       XK_v,          spawn,               SHCMD("st -c nvim -g 140x34 -e nvim")},
    // { MODKEY|ShiftMask,             XK_i,          spawn,               SHCMD("inkscape")},
    { MODKEY|ShiftMask,             XK_i,          spawn,               SHCMD("/bin/inkscape")},
    // { ControlMask|Mod1Mask,         XK_r,          spawn,               SHCMD("rofi -show drun -show-icons")},
    { ControlMask|Mod1Mask,         XK_r,          spawn,               SHCMD("/home/sergio/.dotfiles/rofi/launchers/type-6/launcher.sh")},
    { ControlMask|Mod1Mask,         XK_b,          spawn,               SHCMD("feh -z --bg-fill ~/.dotfiles/backgrounds")},
    { MODKEY|Mod1Mask,              XK_c,          spawn,               {.v = calendarcmd} },
    { ControlMask|Mod1Mask,         XK_c,          spawn,               SHCMD("clipmenu")},
    { ControlMask|Mod1Mask,         XK_f,          spawn,               SHCMD("/home/sergio/.dotfiles/dwm/scripts/rofi-files")},
    { MODKEY,                       XK_x,          spawn,               SHCMD("/home/sergio/.dotfiles/dwm/scripts/power-menu") },
    // { MODKEY|Mod1Mask,              XK_p,          spawn,               SHCMD("/home/sergio/.dotfiles/rofi/applets/bin/powermenu.sh") },
    { MODKEY|Mod1Mask,              XK_p,          spawn,               SHCMD("/home/sergio/.dotfiles/rofi/powermenu/type-1/powermenu.sh") },
    { MODKEY,                       XK_Print,      spawn,               SHCMD("/home/sergio/.dotfiles/rofi/applets/bin/screenshot.sh") },
    { ControlMask,                  XK_Print,      spawn,               SHCMD("/home/sergio/.dotfiles/dwm/scripts/screenshot_fullscreen.sh") },
    { MODKEY|Mod1Mask,              XK_b,          spawn,               SHCMD("/home/sergio/.dotfiles/rofi/applets/bin/battery.sh") },
    { MODKEY|Mod1Mask,              XK_d,          spawn,               SHCMD(APP_DUNSTCLOSE) },
    { MODKEY,                       XK_p,          spawn,               {.v = dmenucmd } },
    { MODKEY|ControlMask,           XK_m,          spawn,               {.v = mixercmd } },
    { MODKEY|ControlMask,           XK_a,          spawn,               {.v = amixercmd } },
    { MODKEY|ControlMask,           XK_p,          spawn,               SHCMD("pavucontrol") },
    { ControlMask|Mod1Mask,         XK_m,          spawn,               {.v = mutemic } },
    { MODKEY,                       XK_s,          spawn,               {.v = lockcmd}},
    { MODKEY,                       XK_Return,     spawn,               {.v = termcmd } },
    { ControlMask,                  XK_F7,         spawn,               {.v = term2cmd } },
    { ControlMask,                  XK_F8,         spawn,               {.v = rangercmd2 } },
    { MODKEY|ShiftMask,             XK_t,          spawn,               {.v = htcmd } },
    { MODKEY,                       XK_r,          spawn,               {.v = rangercmd } },
    { MODKEY|Mod1Mask,              XK_r,          spawn,               SHCMD("/home/sergio/.dotfiles/rofi/launchers/type-3/launcher.sh")},
    { MODKEY,                       XK_w,          spawn,               {.v = browcmd } },
    { MODKEY,                       XK_n,          spawn,               {.v = nemocmd } },
    { MODKEY|ShiftMask,             XK_n,          spawn,               {.v = newsboatcmd } },
    // { MODKEY|ShiftMask,             XK_u,          togglescratch,       {.v = scratchpadcmd } },
    { MODKEY|ShiftMask,             XK_u,          togglescratch,       SHCMD("scratchtermtoggle")},
    { MODKEY,                       XK_b,          togglebar,           {0} },
    { MODKEY,             XK_bracketleft,          shiftview,           {.i = -1} },
    { MODKEY,             XK_bracketright,         shiftview,           {.i = +1} },
    { MODKEY|ShiftMask,             XK_j,          rotatestack,         {.i = +1 } },
    { MODKEY|ShiftMask,             XK_k,          rotatestack,         {.i = -1 } },
    { MODKEY|Mod1Mask,              XK_k,          spawn,               SHCMD("ps -o comm --no-headers x | uniq | rofi -dmenu | xargs killall")},
    { ControlMask|Mod1Mask,         XK_t,          spawn,               SHCMD("telegram-desktop")},
    // { ControlMask|Mod1Mask,         XK_o,          spawn,               { .v = rofioldcmd }},
    { ControlMask|Mod1Mask,         XK_e,          spawn,               { .v = wikicmd }},
    { ControlMask|Mod1Mask,         XK_d,          spawn,               { .v = dradiocmd }},
    { MODKEY,                       XK_F2,         spawn,               {.v = (const char*[]){ "dmenurecord", NULL } } },
    { MODKEY,                       XK_F3,         spawn,               {.v = (const char*[]){ "dmenurecord", "kill", NULL } } },
    { MODKEY|ControlMask,           XK_F6,         spawn,               SHCMD("dumpceararural")},
    { MODKEY|ControlMask,           XK_F7,         spawn,               SHCMD("dumpceararural stop")},
    { MODKEY,                       XK_F4,         spawn,               SHCMD("killall screenkey || screenkey &") },
    { MODKEY,                       XK_j,          focusstack,          {.i = +1 } },
    { MODKEY,                       XK_k,          focusstack,          {.i = -1 } },
    { MODKEY,                       XK_i,          incnmaster,          {.i = +1 } },
    { MODKEY,                       XK_d,          incnmaster,          {.i = -1 } },
    { MODKEY,                       XK_h,          setmfact,            {.f = -0.05} },
    { MODKEY,                       XK_l,          setmfact,            {.f = +0.05} },
    { MODKEY|ShiftMask,             XK_h,          setcfact,            {.f = +0.25} },
    { MODKEY|ShiftMask,             XK_l,          setcfact,            {.f = -0.25} },
    { MODKEY|ShiftMask,             XK_o,          setcfact,            {.f =  0.00} },
    { MODKEY|ShiftMask,             XK_Return,     zoom,                {0} },
    { MODKEY,                       XK_Tab,        view,                {0} },
    // { ControlMask|Mod1Mask,         XK_p,          view,                {.i = +1} },
    { MODKEY|ShiftMask,             XK_c,          killclient,          {0} },
    { MODKEY,                       XK_q,          killclient,          {0} },
    { MODKEY,                       XK_t,          setlayout,           {.v = &layouts[0]} },
    { MODKEY,                       XK_f,          setlayout,           {.v = &layouts[1]} },
    { MODKEY,                       XK_m,          setlayout,           {.v = &layouts[2]} },
    { MODKEY,                       XK_g,          setlayout,           {.v = &layouts[3]} },
    { MODKEY,                       XK_space,      setlayout,           {0} },
    { MODKEY|ShiftMask,             XK_space,      togglefloating,      {0} },
    { MODKEY,                       XK_0,          view,                {.ui = ~0 } },
    { MODKEY|ShiftMask,             XK_0,          tag,                 {.ui = ~0 } },
    { MODKEY,                       XK_comma,      focusmon,            {.i = -1 } },
    { MODKEY,                       XK_period,     focusmon,            {.i = +1 } },
    { MODKEY|ShiftMask,             XK_comma,      tagmon,              {.i = -1 } },
    { MODKEY|ShiftMask,             XK_period,     tagmon,              {.i = +1 } },
    TAGKEYS(                        XK_1,                               0)
    TAGKEYS(                        XK_2,                               1)
    TAGKEYS(                        XK_3,                               2)
    TAGKEYS(                        XK_4,                               3)
    TAGKEYS(                        XK_5,                               4)
    TAGKEYS(                        XK_6,                               5)
    TAGKEYS(                        XK_7,                               6)
    TAGKEYS(                        XK_8,                               7)
    TAGKEYS(                        XK_9,                               8)
    { MODKEY|ShiftMask,             XK_q,          quit,                {0} },
    { MODKEY|ControlMask|ShiftMask, XK_q,          quit,                {1} },
    { MODKEY,                       XK_u,          focusurgent,         {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
    /* click                event mask      button          function        argument */
    { ClkClientWin,   ControlMask|Mod1Mask,  Button1,   spawn,    SHCMD("xdotool click --delay 0 --window $(xdotool getactivewindow) --clearmodifiers 2") },
    { ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
    { ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
    { ClkWinTitle,          0,              Button2,        zoom,           {0} },
    { ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
    { ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
    { ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
    { ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
    { ClkTagBar,            0,              Button1,        view,           {0} },
    { ClkTagBar,            0,              Button3,        toggleview,     {0} },
    { ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
    { ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

