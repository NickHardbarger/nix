config.load_autoconfig(False)
c.content.user_stylesheets = ["~/.config/qutebrowser/styles/youtube.css",
                              "~/.config/qutebrowser/styles/theme.css"]
# Gruvbox
bg0_hard = "#1d2021"
bg0_soft = '#32302f'
bg0_normal = '#282828'
bg0 = bg0_normal
bg1 = "#3c3836"
bg2 = "#504945"
bg3 = "#665c54"
bg4 = "#7c6f64"
fg0 = "#fbf1c7"
fg1 = "#ebdbb2"
fg2 = "#d5c4a1"
fg3 = "#bdae93"
fg4 = "#a89984"
bright_red = "#fb4934"
bright_green = "#b8bb26"
bright_yellow = "#fabd2f"
bright_blue = "#83a598"
bright_purple = "#d3869b"
bright_aqua = "#8ec07c"
bright_gray = "#928374"
bright_orange = "#fe8019"
dark_red = "#cc241d"
dark_green = "#98971a"
dark_yellow = "#d79921"
dark_blue = "#458588"
dark_purple = "#b16286"
dark_aqua = "#689d6a"
dark_gray = "#a89984"
dark_orange = "#d65d0e"

### Theming
c.colors.completion.fg = [fg1, bright_aqua, bright_yellow]
c.colors.completion.odd.bg = bg0
c.colors.completion.even.bg = c.colors.completion.odd.bg
c.colors.completion.category.fg = bright_blue
c.colors.completion.category.bg = bg1
c.colors.completion.category.border.top = c.colors.completion.category.bg
c.colors.completion.category.border.bottom = c.colors.completion.category.bg
c.colors.completion.item.selected.fg = fg0
c.colors.completion.item.selected.bg = bg4
c.colors.completion.item.selected.border.top = bg2
c.colors.completion.item.selected.border.bottom = c.colors.completion.item.selected.border.top
c.colors.completion.item.selected.match.fg = bright_orange
c.colors.completion.match.fg = c.colors.completion.item.selected.match.fg
c.colors.completion.scrollbar.fg = c.colors.completion.item.selected.fg
c.colors.completion.scrollbar.bg = c.colors.completion.category.bg
c.colors.contextmenu.disabled.bg = bg3
c.colors.contextmenu.disabled.fg = fg3
c.colors.contextmenu.menu.bg = bg0
c.colors.contextmenu.menu.fg =  fg2
c.colors.contextmenu.selected.bg = bg2
c.colors.contextmenu.selected.fg = c.colors.contextmenu.menu.fg
c.colors.downloads.bar.bg = bg0
c.colors.downloads.start.fg = bg0
c.colors.downloads.start.bg = bright_blue
c.colors.downloads.stop.fg = c.colors.downloads.start.fg
c.colors.downloads.stop.bg = bright_aqua
c.colors.downloads.error.fg = bright_red
c.colors.hints.fg = bg0
c.colors.hints.bg = 'rgba(250, 191, 47, 200)'  # bright_yellow
c.colors.hints.match.fg = bg4
c.colors.keyhint.fg = fg4
c.colors.keyhint.suffix.fg = fg0
c.colors.keyhint.bg = bg0
c.colors.messages.error.fg = bg0
c.colors.messages.error.bg = bright_red
c.colors.messages.error.border = c.colors.messages.error.bg
c.colors.messages.warning.fg = bg0
c.colors.messages.warning.bg = bright_purple
c.colors.messages.warning.border = c.colors.messages.warning.bg
c.colors.messages.info.fg = fg2
c.colors.messages.info.bg = bg0
c.colors.messages.info.border = c.colors.messages.info.bg
c.colors.prompts.fg = fg2
c.colors.prompts.border = f'1px solid {bg1}'
c.colors.prompts.bg = bg3
c.colors.prompts.selected.bg = bg2
c.colors.statusbar.normal.fg = fg2
c.colors.statusbar.normal.bg = bg0
c.colors.statusbar.insert.fg = bg0
c.colors.statusbar.insert.bg = dark_aqua
c.colors.statusbar.passthrough.fg = bg0
c.colors.statusbar.passthrough.bg = dark_blue
c.colors.statusbar.private.fg = bright_purple
c.colors.statusbar.private.bg = bg0
c.colors.statusbar.command.fg = fg3
c.colors.statusbar.command.bg = bg1
c.colors.statusbar.command.private.fg = c.colors.statusbar.private.fg
c.colors.statusbar.command.private.bg = c.colors.statusbar.command.bg
c.colors.statusbar.caret.fg = bg0
c.colors.statusbar.caret.bg = dark_purple
c.colors.statusbar.caret.selection.fg = c.colors.statusbar.caret.fg
c.colors.statusbar.caret.selection.bg = bright_purple
c.colors.statusbar.progress.bg = bright_blue
c.colors.statusbar.url.fg = fg4
c.colors.statusbar.url.error.fg = dark_red
c.colors.statusbar.url.hover.fg = bright_orange
c.colors.statusbar.url.success.http.fg = bright_red
c.colors.statusbar.url.success.https.fg = fg0
c.colors.statusbar.url.warn.fg = bright_purple
c.colors.tabs.bar.bg = bg0
c.colors.tabs.indicator.start = bright_blue
c.colors.tabs.indicator.stop = bright_aqua
c.colors.tabs.indicator.error = bright_red
c.colors.tabs.odd.fg = fg2
c.colors.tabs.odd.bg = bg2
c.colors.tabs.even.fg = c.colors.tabs.odd.fg
c.colors.tabs.even.bg = bg3
c.colors.tabs.selected.odd.fg = fg2
c.colors.tabs.selected.odd.bg = bg0
c.colors.tabs.selected.even.fg = c.colors.tabs.selected.odd.fg
c.colors.tabs.selected.even.bg = bg0
c.colors.tabs.pinned.even.bg = bright_green
c.colors.tabs.pinned.even.fg = bg2
c.colors.tabs.pinned.odd.bg = bright_green
c.colors.tabs.pinned.odd.fg = c.colors.tabs.pinned.even.fg
c.colors.tabs.pinned.selected.even.bg = bg0
c.colors.tabs.pinned.selected.even.fg = c.colors.tabs.selected.odd.fg
c.colors.tabs.pinned.selected.odd.bg = c.colors.tabs.pinned.selected.even.bg
c.colors.tabs.pinned.selected.odd.fg = c.colors.tabs.selected.odd.fg

# Darkmode
c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
c.colors.webpage.darkmode.contrast = 0.0
c.colors.webpage.darkmode.enabled = False # for some reason, it has to be set to false to work?
c.colors.webpage.darkmode.policy.images = 'smart-simple'
c.colors.webpage.darkmode.policy.page = 'always'
c.colors.webpage.darkmode.threshold.background = 0
c.colors.webpage.darkmode.threshold.foreground = 256
c.colors.webpage.preferred_color_scheme = 'dark'

# Adblock
c.content.blocking.adblock.lists = ["https://easylist.to/easylist/easylist.txt",
                                    "https://easylist.to/easylist/easyprivacy.txt",
                                    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/legacy.txt",
                                    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt",
                                    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2020.txt",
                                    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2021.txt",
                                    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2022.txt",
                                    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2023.txt",
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
                                    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt"]
c.content.blocking.enabled = True
c.content.blocking.hosts.block_subdomains = True
c.content.blocking.hosts.lists = ['https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts']
c.content.blocking.method = 'auto'
c.content.blocking.whitelist = []

# Cookies
c.content.cookies.accept = 'all'
c.content.cookies.store = True

# Fonts
c.fonts.default_family = ["JetBrainsMonoNF"]
c.fonts.default_size = '12pt'

c.fonts.completion.category = 'bold default_size default_family'
c.fonts.completion.entry = 'default_size default_family'
c.fonts.contextmenu = 'default_size default_family'
c.fonts.debug_console = 'default_size default_family'
c.fonts.downloads = 'default_size default_family'
c.fonts.hints = 'bold default_size default_family'
c.fonts.keyhint = 'default_size default_family'
c.fonts.messages.error = 'default_size default_family'
c.fonts.messages.info = 'default_size default_family'
c.fonts.messages.warning = 'default_size default_family'
c.fonts.prompts = 'default_size sans-serif'
c.fonts.statusbar = 'default_size default_family'
c.fonts.tabs.selected = 'default_size default_family'
c.fonts.tabs.unselected = 'default_size default_family'
c.fonts.tooltip = 'default_size default_family'

c.fonts.web.family.cursive = 'monospace'
c.fonts.web.family.fantasy = 'monospace'
c.fonts.web.family.fixed = 'monospace'
c.fonts.web.family.sans_serif = 'monospace'
c.fonts.web.family.serif = 'monospace'
c.fonts.web.family.standard = 'monospace'

c.fonts.web.size.default = 16
c.fonts.web.size.default_fixed = 13
c.fonts.web.size.minimum = 0
c.fonts.web.size.minimum_logical = 6

# Hints
c.hints.border = '1px solid #d79921'
c.hints.padding = {'top': 0, 'bottom': 0, 'left': 3, 'right': 3}
c.hints.radius = 3

# Scrolling
c.scrolling.bar = 'never'
c.scrolling.smooth = False

# Status bar
c.statusbar.padding = {'top': 1, 'bottom': 1, 'left': 0, 'right': 0}
c.statusbar.position = 'bottom'
c.statusbar.show = 'always'
c.statusbar.widgets = ['keypress', 'search_match', 'url', 'scroll', 'history', 'tabs', 'progress']

# Tabs
c.tabs.indicator.padding = {'top': 2, 'bottom': 2, 'left': 0, 'right': 4}
c.tabs.padding = {'top': 0, 'bottom': 0, 'left': 5, 'right': 5}
c.tabs.title.format = '{private}{audio}{perc}{index}: {current_title}'

# Search
c.url.auto_search = 'naive'
c.url.default_page = 'https://start.duckduckgo.com/'
c.url.incdec_segments = ['path', 'query']
c.url.open_base_url = False
c.url.start_pages = ['https://start.duckduckgo.com/']
c.url.yank_ignored_parameters = ['ref', 'utm_source', 'utm_medium', 'utm_campaign', 'utm_term', 'utm_content', 'utm_name']

c.url.searchengines = {
    'DEFAULT': 'https://duckduckgo.com/?q={}',
}

# Window
c.window.hide_decoration = False
c.window.title_format = 'qutebrowser'
c.window.transparent = False

# Misc
c.content.pdfjs = True
c.content.autoplay = False
c.auto_save.session = False
