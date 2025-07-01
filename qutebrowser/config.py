c = c  # noqa: F821 pylint: disable=E0602,C0103
config = config  # noqa: F821 pylint: disable=E0602,C0103

config.set(
    "window.hide_decoration", False
)  # not having window decoration breaks window tiling

# c.window.transparent = True

c.tabs.title.format = "{audio}{current_title}"
c.fonts.web.size.default = 20

c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "!aw": "https://wiki.archlinux.org/?search={}",
    "!apkg": "https://archlinux.org/packages/?sort=&q={}&maintainer=&flagged=",
    "!gh": "https://github.com/search?o=desc&q={}&s=stars",
    "!yt": "https://www.youtube.com/results?search_query={}",
}

c.completion.open_categories = [
    "searchengines",
    "quickmarks",
    "bookmarks",
    "history",
    "filesystem",
]

config.load_autoconfig()  # load settings done via the gui

c.auto_save.session = True  # save tabs on quit/restart

# dark mode setup # dark mode likes to break stuff
c.colors.webpage.prefers_color_scheme_dark = True
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.algorithm = "lightness-hsl"
c.colors.webpage.darkmode.policy.images = "never"
config.set("colors.webpage.darkmode.enabled", False, "file://*")

# fonts
c.fonts.default_family = []
c.fonts.default_size = "14pt"
c.fonts.web.family.fixed = "monospace"
c.fonts.web.family.sans_serif = "monospace"
c.fonts.web.family.serif = "monospace"
c.fonts.web.family.standard = "monospace"

# privacy - adjust these settings based on your preference
config.set("content.webgl", True, "*")
config.set("content.canvas_reading", True)
config.set("content.geolocation", False)
# config.set("content.webrtc_ip_handling_policy", "default-public-interface-only")
config.set("content.cookies.accept", "no-3rdparty")
config.set("content.cookies.store", True)
# config.set("content.javascript.enabled", False) # tsh keybind to toggle

# Adblocking info -->
c.content.blocking.enabled = True
c.content.blocking.method = "adblock"  # uncomment this if you install python-adblock
c.content.blocking.adblock.lists = [
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/legacy.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2024.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badware.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-cookies.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-others.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/quick-fixes.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt",
    "https://letsblock.it/filters/youtube-shorts",
]

# change j, k scroll amount
# config.unbind("j", mode="normal")
# config.unbind("k", mode="normal")
# config.bind("j", "cmd-run-with-count 3 scroll down")
# config.bind("k", "cmd-run-with-count 3 scroll up")

# unbind tab select keys
config.unbind("<Alt-1>", mode="normal")
config.unbind("<Alt-2>", mode="normal")
config.unbind("<Alt-3>", mode="normal")
config.unbind("<Alt-4>", mode="normal")
config.unbind("<Alt-5>", mode="normal")
config.unbind("<Alt-6>", mode="normal")
config.unbind("<Alt-7>", mode="normal")
config.unbind("<Alt-8>", mode="normal")

# bind new tab select keys
config.bind("<Cmd-1>", "tab-focus 1")
config.bind("<Cmd-2>", "tab-focus 2")
config.bind("<Cmd-3>", "tab-focus 3")
config.bind("<Cmd-4>", "tab-focus 4")
config.bind("<Cmd-5>", "tab-focus 5")
config.bind("<Cmd-6>", "tab-focus 6")
config.bind("<Cmd-7>", "tab-focus 7")
config.bind("<Cmd-8>", "tab-focus 8")

# base16-qutebrowser (https://github.com/theova/base16-qutebrowser)
#

base00 = "#000000"
base01 = "#121212"
base02 = "#222222"
base03 = "#333333"
base04 = "#999999"
base05 = "#c1c1c1"
base06 = "#999999"
base07 = "#c1c1c1"
base08 = "#5f8787"
base09 = "#aaaaaa"
base0A = "#8c7f70"
base0B = "#9b8d7f"
base0C = "#aaaaaa"
base0D = "#888888"
base0E = "#999999"
base0F = "#444444"

# set qutebrowser colors

c.colors.statusbar.normal.bg = "#00000000"
c.colors.statusbar.command.bg = "#00000000"
c.statusbar.show = "always"
# c.colors.tabs.even.bg = "#00000000"  # transparent tabs!!
# c.colors.tabs.odd.bg = "#00000000"
c.colors.tabs.bar.bg = "#00000000"
c.tabs.show = "multiple"
c.tabs.position = "left"  # sidebar tabs, set to "top" for default

# pineed tab colors
c.colors.tabs.pinned.even.bg = "#00000000"
c.colors.tabs.pinned.even.fg = base05
c.colors.tabs.pinned.odd.bg = "#00000000"
c.colors.tabs.pinned.odd.fg = base05
c.colors.tabs.pinned.selected.even.bg = base0F
c.colors.tabs.pinned.selected.even.fg = base05
c.colors.tabs.pinned.selected.odd.bg = base0F
c.colors.tabs.pinned.selected.odd.fg = base05

# base tab colors
c.colors.tabs.odd.bg = "#00000000"
c.colors.tabs.odd.fg = base05
c.colors.tabs.even.bg = "#00000000"
c.colors.tabs.even.fg = base05
c.colors.tabs.selected.even.bg = base0F
c.colors.tabs.selected.even.fg = base05
c.colors.tabs.selected.odd.bg = base0F
c.colors.tabs.selected.odd.fg = base05

# Text color of the completion widget. May be a single color to use for
# all columns or a list of three colors, one for each column.
c.colors.completion.fg = base05
c.colors.completion.odd.bg = base01
c.colors.completion.even.bg = base00
c.colors.completion.category.fg = base0A
c.colors.completion.category.bg = base00
c.colors.completion.category.border.top = base00
c.colors.completion.category.border.bottom = base00
c.colors.completion.item.selected.fg = base05
c.colors.completion.item.selected.bg = base02
c.colors.completion.item.selected.border.top = base02
c.colors.completion.item.selected.border.bottom = base02
c.colors.completion.item.selected.match.fg = base0B
c.colors.completion.match.fg = base0B
c.colors.completion.scrollbar.fg = base05
c.colors.completion.scrollbar.bg = base00
c.colors.contextmenu.disabled.bg = base01
c.colors.contextmenu.disabled.fg = base04
c.colors.contextmenu.menu.bg = base00
c.colors.contextmenu.menu.fg = base05
c.colors.contextmenu.selected.bg = base02
c.colors.contextmenu.selected.fg = base05
c.colors.downloads.bar.bg = base00
c.colors.downloads.start.fg = base00
c.colors.downloads.start.bg = base0D
c.colors.downloads.stop.fg = base00
c.colors.downloads.stop.bg = base0C
c.colors.downloads.error.fg = base08
c.colors.hints.fg = base00

# Background color for hints. Note that you can use a `rgba(...)` value
# for transparency.
c.colors.hints.bg = base0A
c.colors.hints.match.fg = base05
c.colors.keyhint.fg = base05
c.colors.keyhint.suffix.fg = base05
c.colors.keyhint.bg = base00
c.colors.messages.error.fg = base00
c.colors.messages.error.bg = base08
c.colors.messages.error.border = base08
c.colors.messages.warning.fg = base00
c.colors.messages.warning.bg = base0E
c.colors.messages.warning.border = base0E
c.colors.messages.info.fg = base05
c.colors.messages.info.bg = base00
c.colors.messages.info.border = base00
c.colors.prompts.fg = base05
c.colors.prompts.border = base00

# Background color for prompts.
c.colors.prompts.bg = base00
c.colors.prompts.selected.bg = base02
c.colors.prompts.selected.fg = base05
c.colors.statusbar.normal.fg = base0B
c.colors.statusbar.normal.bg = base00
c.colors.statusbar.insert.fg = base00
c.colors.statusbar.insert.bg = base0D
c.colors.statusbar.passthrough.fg = base00
c.colors.statusbar.passthrough.bg = base0C
c.colors.statusbar.private.fg = base00
c.colors.statusbar.private.bg = base01
c.colors.statusbar.command.fg = base05
c.colors.statusbar.command.bg = base00
c.colors.statusbar.command.private.fg = base05
c.colors.statusbar.command.private.bg = base00
c.colors.statusbar.caret.fg = base00
c.colors.statusbar.caret.bg = base0E
c.colors.statusbar.caret.selection.fg = base00
c.colors.statusbar.caret.selection.bg = base0D
c.colors.statusbar.progress.bg = base0D
c.colors.statusbar.url.fg = base05
c.colors.statusbar.url.error.fg = base08
c.colors.statusbar.url.hover.fg = base05

# Foreground color of the URL in the statusbar on successful load
# (http).
c.colors.statusbar.url.success.http.fg = base0C

# Foreground color of the URL in the statusbar on successful load
# (https).
c.colors.statusbar.url.success.https.fg = base0B
c.colors.statusbar.url.warn.fg = base0E
c.colors.tabs.bar.bg = base00
c.colors.tabs.indicator.start = base0D
c.colors.tabs.indicator.stop = base0C
c.colors.tabs.indicator.error = base08

# Background color for webpages if unset (or empty to use the theme's
# color).
# c.colors.webpage.bg = base00
