c = c  # noqa: F821 pylint: disable=E0602,C0103
config = config  # noqa: F821 pylint: disable=E0602,C0103

config.set(
    "window.hide_decoration", False
)  # not having window decoration breaks window tiling

# c.window.transparent = True

c.tabs.title.format = "{audio}{current_title}"
c.fonts.web.size.default = 14

c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "!aw": "https://wiki.archlinux.org/?search={}",
    "!apkg": "https://archlinux.org/packages/?sort=&q={}&maintainer=&flagged=",
    "!gh": "https://github.com/search?o=desc&q={}&s=stars",
    "!yt": "https://www.youtube.com/results?search_query={}",
}

c.completion.open_categories = [
    "quickmarks",
    "bookmarks",
    "filesystem",
]

config.load_autoconfig()  # load settings done via the gui

c.auto_save.session = True  # save tabs on quit/restart

# dark mode setup # dark mode likes to break stuff
# c.colors.webpage.prefers_color_scheme_dark = True
c.colors.webpage.darkmode.enabled = False
# lightness-cielab, lightness-hsl, brightness-rgb
c.colors.webpage.darkmode.algorithm = "lightness-cielab"
c.colors.webpage.darkmode.policy.images = "never"
config.set("colors.webpage.darkmode.enabled", False, "file://*")

# fonts
c.fonts.default_family = "JetBrains Mono"
c.fonts.default_size = "10pt"
c.fonts.web.family.fixed = "JetBrains Mono"
c.fonts.web.family.sans_serif = "JetBrains Mono"
c.fonts.web.family.serif = "JetBrains Mono"
c.fonts.web.family.standard = "JetBrains Mono"

# privacy - adjust these settings based on your preference
# config.set("content.webgl", True, "*")
# config.set("content.canvas_reading", True)
# config.set("content.geolocation", True)
# config.set("content.webrtc_ip_handling_policy", "default-public-interface-only")
# config.set("content.cookies.accept", "no-3rdparty")
# config.set("content.cookies.store", True)
# config.set("content.javascript.enabled", True)  # tsh keybind to toggle

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
    "https://letsblock.it/filters/youtube-shorts",
]

# open mpv for youtube playback
config.bind(",m", "spawn mpv {url}")
config.bind(",M", "hint links mpv {hint-url}")

# nord theme

nord = {
    "base03": "#3b4252",
    "base02": "#434c5e",
    "base01": "#e5e9f0",
    "base00": "#d8dee9",
    "base0": "#4c566a",
    "base1": "#5e81ac",
    "base2": "#eee8d5",
    "base3": "#eceff4",
    "yellow": "#ebcb8b",
    "orange": "#ebcb8b",
    "red": "#bf616a",
    "magenta": "#b48ead",
    "violet": "#8fbcbb",
    "blue": "#5e81ac",
    "cyan": "#88c0d0",
    "green": "#a3be8c",
}

c.colors.completion.category.bg = nord["base03"]
c.colors.completion.category.border.bottom = nord["base03"]
c.colors.completion.category.border.top = nord["base03"]
c.colors.completion.category.fg = nord["base3"]
c.colors.completion.even.bg = nord["base02"]
c.colors.completion.fg = nord["base3"]
c.colors.completion.item.selected.bg = nord["violet"]
c.colors.completion.item.selected.border.bottom = nord["violet"]
c.colors.completion.item.selected.border.top = nord["violet"]
c.colors.completion.item.selected.fg = nord["base3"]
c.colors.completion.match.fg = nord["base2"]
c.colors.completion.odd.bg = nord["base02"]
c.colors.completion.scrollbar.bg = nord["base0"]
c.colors.completion.scrollbar.fg = nord["base2"]
c.colors.downloads.bar.bg = nord["base03"]
c.colors.downloads.error.bg = nord["red"]
c.colors.downloads.error.fg = nord["base3"]
# c.colors.downloads.start.bg = '#0000aa'
c.colors.downloads.start.fg = nord["base3"]
# c.colors.downloads.stop.bg = '#00aa00'
# c.colors.downloads.stop.fg = nord['base3']
c.colors.hints.bg = nord["violet"]
c.colors.hints.fg = nord["base3"]
c.colors.hints.match.fg = nord["base2"]
c.colors.keyhint.fg = nord["base3"]
c.colors.keyhint.suffix.fg = nord["yellow"]
c.colors.messages.error.bg = nord["red"]
c.colors.messages.error.border = nord["red"]
c.colors.messages.error.fg = nord["base3"]
c.colors.messages.info.bg = nord["base03"]
c.colors.messages.info.border = nord["base03"]
c.colors.messages.info.fg = nord["base3"]
c.colors.messages.warning.bg = nord["orange"]
c.colors.messages.warning.border = nord["orange"]
c.colors.messages.warning.fg = nord["base3"]
c.colors.prompts.bg = nord["base02"]
c.colors.prompts.border = "1px solid " + nord["base3"]
c.colors.prompts.fg = nord["base3"]
c.colors.prompts.selected.bg = nord["base01"]
c.colors.statusbar.caret.bg = nord["blue"]
c.colors.statusbar.caret.fg = nord["base3"]
c.colors.statusbar.caret.selection.bg = nord["violet"]
c.colors.statusbar.caret.selection.fg = nord["base3"]
c.colors.statusbar.command.bg = nord["base03"]
c.colors.statusbar.command.fg = nord["base3"]
c.colors.statusbar.command.private.bg = nord["base01"]
c.colors.statusbar.command.private.fg = nord["base3"]
c.colors.statusbar.insert.bg = nord["green"]
c.colors.statusbar.insert.fg = nord["base3"]
c.colors.statusbar.normal.bg = nord["base03"]
c.colors.statusbar.normal.fg = nord["base3"]
c.colors.statusbar.passthrough.bg = nord["magenta"]
c.colors.statusbar.passthrough.fg = nord["base3"]
c.colors.statusbar.private.bg = nord["base01"]
c.colors.statusbar.private.fg = nord["base3"]
c.colors.statusbar.progress.bg = nord["base3"]
c.colors.statusbar.url.error.fg = nord["red"]
c.colors.statusbar.url.fg = nord["base3"]
c.colors.statusbar.url.hover.fg = nord["base2"]
c.colors.statusbar.url.success.http.fg = nord["base3"]
c.colors.statusbar.url.success.https.fg = nord["base3"]
c.colors.statusbar.url.warn.fg = nord["yellow"]
c.colors.tabs.indicator.error = nord["red"]
c.colors.tabs.indicator.start = nord["violet"]
c.colors.tabs.indicator.stop = nord["orange"]
c.colors.tabs.even.bg = nord["base03"]
c.colors.tabs.even.fg = nord["base2"]
c.colors.tabs.odd.bg = nord["base03"]
c.colors.tabs.odd.fg = nord["base2"]
c.colors.tabs.selected.even.bg = nord["blue"]
c.colors.tabs.selected.even.fg = nord["base3"]
c.colors.tabs.selected.odd.bg = nord["blue"]
c.colors.tabs.selected.odd.fg = nord["base3"]
c.colors.tabs.pinned.even.bg = nord["cyan"]
c.colors.tabs.pinned.even.fg = nord["base2"]
c.colors.tabs.pinned.odd.bg = nord["cyan"]
c.colors.tabs.pinned.odd.fg = nord["base2"]
c.colors.tabs.pinned.selected.even.bg = nord["blue"]
c.colors.tabs.pinned.selected.even.fg = nord["base3"]
c.colors.tabs.pinned.selected.odd.bg = nord["blue"]
c.colors.tabs.pinned.selected.odd.fg = nord["base3"]


# black metal gorgoroth
# base00 = "#000000"
# base01 = "#121212"
# base02 = "#222222"
# base03 = "#333333"
# base04 = "#999999"
# base05 = "#c1c1c1"
# base06 = "#999999"
# base07 = "#c1c1c1"
# base08 = "#5f8787"
# base09 = "#aaaaaa"
# base0A = "#8c7f70"
# base0B = "#9b8d7f"
# base0C = "#aaaaaa"
# base0D = "#888888"
# base0E = "#999999"
# base0F = "#444444"
# c.colors.statusbar.normal.bg = "#00000000"
# c.colors.statusbar.command.bg = "#00000000"
# c.statusbar.show = "always"
# # c.colors.tabs.even.bg = "#00000000"  # transparent tabs!!
# # c.colors.tabs.odd.bg = "#00000000"
# c.colors.tabs.bar.bg = "#00000000"
# c.tabs.show = "multiple"
# c.tabs.position = "top"  # sidebar tabs, set to "top" for default
# c.colors.tabs.pinned.even.bg = "#00000000"
# c.colors.tabs.pinned.even.fg = base05
# c.colors.tabs.pinned.odd.bg = "#00000000"
# c.colors.tabs.pinned.odd.fg = base05
# c.colors.tabs.pinned.selected.even.bg = base0F
# c.colors.tabs.pinned.selected.even.fg = base05
# c.colors.tabs.pinned.selected.odd.bg = base0F
# c.colors.tabs.pinned.selected.odd.fg = base05
# c.colors.tabs.odd.bg = "#00000000"
# c.colors.tabs.odd.fg = base05
# c.colors.tabs.even.bg = "#00000000"
# c.colors.tabs.even.fg = base05
# c.colors.tabs.selected.even.bg = base0F
# c.colors.tabs.selected.even.fg = base05
# c.colors.tabs.selected.odd.bg = base0F
# c.colors.tabs.selected.odd.fg = base05
# c.colors.completion.fg = base05
# c.colors.completion.odd.bg = base01
# c.colors.completion.even.bg = base00
# c.colors.completion.category.fg = base0A
# c.colors.completion.category.bg = base00
# c.colors.completion.category.border.top = base00
# c.colors.completion.category.border.bottom = base00
# c.colors.completion.item.selected.fg = base05
# c.colors.completion.item.selected.bg = base02
# c.colors.completion.item.selected.border.top = base02
# c.colors.completion.item.selected.border.bottom = base02
# c.colors.completion.item.selected.match.fg = base0B
# c.colors.completion.match.fg = base0B
# c.colors.completion.scrollbar.fg = base05
# c.colors.completion.scrollbar.bg = base00
# c.colors.contextmenu.disabled.bg = base01
# c.colors.contextmenu.disabled.fg = base04
# c.colors.contextmenu.menu.bg = base00
# c.colors.contextmenu.menu.fg = base05
# c.colors.contextmenu.selected.bg = base02
# c.colors.contextmenu.selected.fg = base05
# c.colors.downloads.bar.bg = base00
# c.colors.downloads.start.fg = base00
# c.colors.downloads.start.bg = base0D
# c.colors.downloads.stop.fg = base00
# c.colors.downloads.stop.bg = base0C
# c.colors.downloads.error.fg = base08
# c.colors.hints.fg = base00
# c.colors.hints.bg = base0A
# c.colors.hints.match.fg = base05
# c.colors.keyhint.fg = base05
# c.colors.keyhint.suffix.fg = base05
# c.colors.keyhint.bg = base00
# c.colors.messages.error.fg = base00
# c.colors.messages.error.bg = base08
# c.colors.messages.error.border = base08
# c.colors.messages.warning.fg = base00
# c.colors.messages.warning.bg = base0E
# c.colors.messages.warning.border = base0E
# c.colors.messages.info.fg = base05
# c.colors.messages.info.bg = base00
# c.colors.messages.info.border = base00
# c.colors.prompts.fg = base05
# c.colors.prompts.border = base00
# c.colors.prompts.bg = base00
# c.colors.prompts.selected.bg = base02
# c.colors.prompts.selected.fg = base05
# c.colors.statusbar.normal.fg = base0B
# c.colors.statusbar.normal.bg = base00
# c.colors.statusbar.insert.fg = base00
# c.colors.statusbar.insert.bg = base0D
# c.colors.statusbar.passthrough.fg = base00
# c.colors.statusbar.passthrough.bg = base0C
# c.colors.statusbar.private.fg = base00
# c.colors.statusbar.private.bg = base01
# c.colors.statusbar.command.fg = base05
# c.colors.statusbar.command.bg = base00
# c.colors.statusbar.command.private.fg = base05
# c.colors.statusbar.command.private.bg = base00
# c.colors.statusbar.caret.fg = base00
# c.colors.statusbar.caret.bg = base0E
# c.colors.statusbar.caret.selection.fg = base00
# c.colors.statusbar.caret.selection.bg = base0D
# c.colors.statusbar.progress.bg = base0D
# c.colors.statusbar.url.fg = base05
# c.colors.statusbar.url.error.fg = base08
# c.colors.statusbar.url.hover.fg = base05
# c.colors.statusbar.url.success.http.fg = base0C
# c.colors.statusbar.url.success.https.fg = base0B
# c.colors.statusbar.url.warn.fg = base0E
# c.colors.tabs.bar.bg = base00
# c.colors.tabs.indicator.start = base0D
# c.colors.tabs.indicator.stop = base0C
# c.colors.tabs.indicator.error = base08
# c.colors.webpage.bg = base00
