/* See LICENSE file for copyright and license details. */

/* appearance */
static const char font[]            = "-*-terminus-medium-r-*-*-12-*-*-*-*-*-*-*";
static const char normbordercolor[] = "#222222";
static const char normbgcolor[]     = "#ececec";
static const char normfgcolor[]     = "#454545";
static const char selbordercolor[]  = "#cccccc";
static const char selbgcolor[]      = "#4b5c87";
static const char selfgcolor[]      = "#ececec";
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const Bool showbar           = True;     /* False means no bar */
static const Bool topbar            = True;     /* False means bottom bar */

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6" };

static const Rule rules[] = {
	/* class      instance    title       tags mask     isfloating   monitor */
/* floating clients */
    { "MPlayer",      NULL,       NULL,       0,            True, -1 },
    { "VLC",          NULL,       NULL,       0,            True, -1 },
    { "feh",          NULL,       NULL,       0,            True, -1 },
    { "XCalc",        NULL,       NULL,       0,            True, -1 },
    { "Xmessage",     NULL,       NULL,       0,            True, -1 },

/* 2 */
    { "xchm",         NULL,       NULL,       1 << 1,       True, -1 },
    { "evince",       NULL,       NULL,       1 << 1,       True, -1 },
    { "Rt",           NULL,       NULL,       1 << 1,       True, -1 },
    { "Xpdf",         NULL,       NULL,       1 << 1,       True, -1 },
    { "Epdfview",         NULL,       NULL,       1 << 1,       True, -1 },

/* 3 */
    { "Gimp",         NULL,       NULL,       1 << 2,       True, -1 },

/* 4 */
    { "Transmission", NULL,       NULL,       1 << 3,       True, -1 },
    { "Deluge",       NULL,       NULL,       1 << 3,       True, -1 },
    { "Amule",        NULL,       NULL,       1 << 3,       True, -1 },

/* 5 */
    { "Firefox",      NULL,       NULL,       1 << 4,       False, -1},
    { "Google-chrome",      NULL,       NULL,       1 << 4,       False, -1},

/* 6 */
    { "Pidgin",       NULL,       NULL,       1 << 5,       True, -1 },
    { "Skype",        NULL,       NULL,       1 << 5,       True, -1 },
    { "Gorilla",      NULL,       NULL,       1 << 5,       True, -1 },
    { "Keepassx",      NULL,       NULL,       1 << 5,       True, -1 },
};

/* layout(s) */
static const float mfact      = 0.60; /* factor of master area size [0.05..0.95] */
static const Bool resizehints = False; /* True means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
/* commands */
static const char *dmenucmd[] = { "dmenu_run", "-p", "Run", "-b", "-fn", font, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, NULL };
static const char *termcmd[]  = { "urxvt", NULL };
static const char *lockcmd[]  = { "slock", NULL };

static Key keys[] = {
    /* modifier                     key        function        argument */
    { 0,                            XK_F3,     spawn,         {.v = dmenucmd } },
    { 0,                            XK_F2,     spawn,         {.v = termcmd } },
    { MODKEY,                       XK_F5,     spawn,         {.v = lockcmd } },

/*  { MODKEY,                       XK_b,      togglebar,      {0} }, */
    { MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
    { MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
    { MODKEY,                       XK_comma,  setmfact,       {.f = -0.05} },
    { MODKEY,                       XK_period, setmfact,       {.f = +0.05} },

    { MODKEY,                       XK_Return, zoom,           {0} },
    { MODKEY,                       XK_Tab,    view,           {0} },
    { MODKEY|ShiftMask,             XK_c,      killclient,     {0} },

    { MODKEY|ShiftMask,             XK_t,      setlayout,      {.v = &layouts[0]} },
    { MODKEY|ShiftMask,             XK_f,      setlayout,      {.v = &layouts[1]} },
    { MODKEY|ShiftMask,             XK_m,      setlayout,      {.v = &layouts[2]} },

    { MODKEY,                       XK_space,  setlayout,      {0} },
    { MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
    { MODKEY,                       XK_0,      view,           {.ui = ~0 } },
    { MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },

/*  { MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
    { MODKEY,                       XK_period, focusmon,       {.i = +1 } },
    { MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
    { MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } }, */
    TAGKEYS(                        XK_1,                      0)
    TAGKEYS(                        XK_2,                      1)
    TAGKEYS(                        XK_3,                      2)
    TAGKEYS(                        XK_4,                      3)
    TAGKEYS(                        XK_5,                      4)
    TAGKEYS(                        XK_6,                      5)
    { MODKEY,                       XK_F12,    quit,           {0} },
};

/* button definitions */
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
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

