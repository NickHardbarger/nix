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

# Downloads
## Directory to save downloads to. If unset, a sensible OS-specific
## default is used.
## Type: Directory
# c.downloads.location.directory = None

## Prompt the user for the download location. If set to false,
## `downloads.location.directory` will be used.
## Type: Bool
# c.downloads.location.prompt = True

## What to display in the download filename input.
## Type: String
## Valid values:
##   - path: Show only the download path.
##   - filename: Show only download filename.
##   - both: Show download path and filename.
# c.downloads.location.suggestion = 'path'

## Where to show the downloaded files.
## Type: VerticalPosition
## Valid values:
##   - top
##   - bottom
# c.downloads.position = 'top'

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
c.url.default_page = 'https://seek.fyi'
c.url.incdec_segments = ['path', 'query']
c.url.open_base_url = False
c.url.start_pages = ['https://seek.fyi']
c.url.yank_ignored_parameters = ['ref', 'utm_source', 'utm_medium', 'utm_campaign', 'utm_term', 'utm_content', 'utm_name']

c.url.searchengines = {
    'DEFAULT': 'https://seek.fyi/search?q={}',
}

# Window
c.window.hide_decoration = False
c.window.title_format = 'qutebrowser'

## Set the main window background to transparent.  This allows having a
## transparent tab- or statusbar (might require a compositor such as
## picom). However, it breaks some functionality such as dmenu embedding
## via its `-w` option. On some systems, it was additionally reported
## that main window transparency negatively affects performance.  Note
## this setting only affects windows opened after setting it.
## Type: Bool
# c.window.transparent = False

# Zoom
c.zoom.default = '100%'
c.zoom.levels = ['25%', '33%', '50%', '67%', '75%', '90%', '100%', '110%', '125%', '150%', '175%', '200%', '250%', '300%', '400%', '500%']
c.zoom.mouse_divider = 512

# Misc
## Interpret number prefixes as counts for bindings. This enables for vi-
## like bindings that can be prefixed with a number to indicate a count.
## Disabling it allows for emacs-like bindings where number keys are
## passed through (according to `input.forward_unbound_keys`) instead.
## Type: Bool
# c.input.match_counts = True

## Force a Qt platformtheme to use. This sets the `QT_QPA_PLATFORMTHEME`
## environment variable which controls dialogs like the filepicker. By
## default, Qt determines the platform theme based on the desktop
## environment.
## Type: String
# c.qt.force_platformtheme = None

## Display PDF files via PDF.js in the browser without showing a download
## prompt. Note that the files can still be downloaded by clicking the
## download button in the pdf.js viewer. With this set to `false`, the
## `:prompt-open-download --pdfjs` command (bound to `<Ctrl-p>` by
## default) can be used in the download prompt.
## Type: Bool
# c.content.pdfjs = False

## Default filesystem autocomplete suggestions for :open. The elements of
## this list show up in the completion window under the Filesystem
## category when the command line contains `:open` but no argument.
## Type: List of String
# c.completion.favorite_paths = []

c.content.autoplay = False
c.auto_save.session = False
c.backend = 'webengine' # QTWebEngine
