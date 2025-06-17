c.auto_save.session = False

c.backend = 'webengine' # QTWebEngine

## Background color of the completion widget category headers.
## Type: QssColor
# c.colors.completion.category.bg = 'qlineargradient(x1:0, y1:0, x2:0, y2:1, stop:0 #888888, stop:1 #505050)'

## Bottom border color of the completion widget category headers.
## Type: QssColor
# c.colors.completion.category.border.bottom = 'black'

## Top border color of the completion widget category headers.
## Type: QssColor
# c.colors.completion.category.border.top = 'black'

## Foreground color of completion widget category headers.
## Type: QtColor
# c.colors.completion.category.fg = 'white'

## Background color of the completion widget for even rows.
## Type: QssColor
# c.colors.completion.even.bg = '#333333'

## Text color of the completion widget. May be a single color to use for
## all columns or a list of three colors, one for each column.
## Type: List of QtColor, or QtColor
# c.colors.completion.fg = ['white', 'white', 'white']

## Background color of the selected completion item.
## Type: QssColor
# c.colors.completion.item.selected.bg = '#e8c000'

## Bottom border color of the selected completion item.
## Type: QssColor
# c.colors.completion.item.selected.border.bottom = '#bbbb00'

## Top border color of the selected completion item.
## Type: QssColor
# c.colors.completion.item.selected.border.top = '#bbbb00'

## Foreground color of the selected completion item.
## Type: QtColor
# c.colors.completion.item.selected.fg = 'black'

## Foreground color of the matched text in the selected completion item.
## Type: QtColor
# c.colors.completion.item.selected.match.fg = '#ff4444'

## Foreground color of the matched text in the completion.
## Type: QtColor
# c.colors.completion.match.fg = '#ff4444'

## Background color of the completion widget for odd rows.
## Type: QssColor
# c.colors.completion.odd.bg = '#444444'

## Color of the scrollbar in the completion view.
## Type: QssColor
# c.colors.completion.scrollbar.bg = '#333333'

## Color of the scrollbar handle in the completion view.
## Type: QssColor
# c.colors.completion.scrollbar.fg = 'white'

## Background color of disabled items in the context menu. If set to
## null, the Qt default is used.
## Type: QssColor
# c.colors.contextmenu.disabled.bg = None

## Foreground color of disabled items in the context menu. If set to
## null, the Qt default is used.
## Type: QssColor
# c.colors.contextmenu.disabled.fg = None

## Background color of the context menu. If set to null, the Qt default
## is used.
## Type: QssColor
# c.colors.contextmenu.menu.bg = None

## Foreground color of the context menu. If set to null, the Qt default
## is used.
## Type: QssColor
# c.colors.contextmenu.menu.fg = None

## Background color of the context menu's selected item. If set to null,
## the Qt default is used.
## Type: QssColor
# c.colors.contextmenu.selected.bg = None

## Foreground color of the context menu's selected item. If set to null,
## the Qt default is used.
## Type: QssColor
# c.colors.contextmenu.selected.fg = None

## Background color for the download bar.
## Type: QssColor
# c.colors.downloads.bar.bg = 'black'

## Background color for downloads with errors.
## Type: QtColor
# c.colors.downloads.error.bg = 'red'

## Foreground color for downloads with errors.
## Type: QtColor
# c.colors.downloads.error.fg = 'white'

## Color gradient start for download backgrounds.
## Type: QtColor
# c.colors.downloads.start.bg = '#0000aa'

## Color gradient start for download text.
## Type: QtColor
# c.colors.downloads.start.fg = 'white'

## Color gradient stop for download backgrounds.
## Type: QtColor
# c.colors.downloads.stop.bg = '#00aa00'

## Color gradient end for download text.
## Type: QtColor
# c.colors.downloads.stop.fg = 'white'

## Color gradient interpolation system for download backgrounds.
## Type: ColorSystem
## Valid values:
##   - rgb: Interpolate in the RGB color system.
##   - hsv: Interpolate in the HSV color system.
##   - hsl: Interpolate in the HSL color system.
##   - none: Don't show a gradient.
# c.colors.downloads.system.bg = 'rgb'

## Color gradient interpolation system for download text.
## Type: ColorSystem
## Valid values:
##   - rgb: Interpolate in the RGB color system.
##   - hsv: Interpolate in the HSV color system.
##   - hsl: Interpolate in the HSL color system.
##   - none: Don't show a gradient.
# c.colors.downloads.system.fg = 'rgb'

## Background color for hints. Note that you can use a `rgba(...)` value
## for transparency.
## Type: QssColor
# c.colors.hints.bg = 'qlineargradient(x1:0, y1:0, x2:0, y2:1, stop:0 rgba(255, 247, 133, 0.8), stop:1 rgba(255, 197, 66, 0.8))'

## Font color for hints.
## Type: QssColor
# c.colors.hints.fg = 'black'

## Font color for the matched part of hints.
## Type: QtColor
# c.colors.hints.match.fg = 'green'

## Background color of the keyhint widget.
## Type: QssColor
# c.colors.keyhint.bg = 'rgba(0, 0, 0, 80%)'

## Text color for the keyhint widget.
## Type: QssColor
# c.colors.keyhint.fg = '#FFFFFF'

## Highlight color for keys to complete the current keychain.
## Type: QssColor
# c.colors.keyhint.suffix.fg = '#FFFF00'

## Background color of an error message.
## Type: QssColor
# c.colors.messages.error.bg = 'red'

## Border color of an error message.
## Type: QssColor
# c.colors.messages.error.border = '#bb0000'

## Foreground color of an error message.
## Type: QssColor
# c.colors.messages.error.fg = 'white'

## Background color of an info message.
## Type: QssColor
# c.colors.messages.info.bg = 'black'

## Border color of an info message.
## Type: QssColor
# c.colors.messages.info.border = '#333333'

## Foreground color of an info message.
## Type: QssColor
# c.colors.messages.info.fg = 'white'

## Background color of a warning message.
## Type: QssColor
# c.colors.messages.warning.bg = 'darkorange'

## Border color of a warning message.
## Type: QssColor
# c.colors.messages.warning.border = '#d47300'

## Foreground color of a warning message.
## Type: QssColor
# c.colors.messages.warning.fg = 'black'

## Background color for prompts.
## Type: QssColor
# c.colors.prompts.bg = '#444444'

## Border used around UI elements in prompts.
## Type: String
# c.colors.prompts.border = '1px solid gray'

## Foreground color for prompts.
## Type: QssColor
# c.colors.prompts.fg = 'white'

## Background color for the selected item in filename prompts.
## Type: QssColor
# c.colors.prompts.selected.bg = 'grey'

## Foreground color for the selected item in filename prompts.
## Type: QssColor
# c.colors.prompts.selected.fg = 'white'

## Background color of the statusbar in caret mode.
## Type: QssColor
# c.colors.statusbar.caret.bg = 'purple'

## Foreground color of the statusbar in caret mode.
## Type: QssColor
# c.colors.statusbar.caret.fg = 'white'

## Background color of the statusbar in caret mode with a selection.
## Type: QssColor
# c.colors.statusbar.caret.selection.bg = '#a12dff'

## Foreground color of the statusbar in caret mode with a selection.
## Type: QssColor
# c.colors.statusbar.caret.selection.fg = 'white'

## Background color of the statusbar in command mode.
## Type: QssColor
# c.colors.statusbar.command.bg = 'black'

## Foreground color of the statusbar in command mode.
## Type: QssColor
# c.colors.statusbar.command.fg = 'white'

## Background color of the statusbar in private browsing + command mode.
## Type: QssColor
# c.colors.statusbar.command.private.bg = 'darkslategray'

## Foreground color of the statusbar in private browsing + command mode.
## Type: QssColor
# c.colors.statusbar.command.private.fg = 'white'

## Background color of the statusbar in insert mode.
## Type: QssColor
# c.colors.statusbar.insert.bg = 'darkgreen'

## Foreground color of the statusbar in insert mode.
## Type: QssColor
# c.colors.statusbar.insert.fg = 'white'

## Background color of the statusbar.
## Type: QssColor
# c.colors.statusbar.normal.bg = 'black'

## Foreground color of the statusbar.
## Type: QssColor
# c.colors.statusbar.normal.fg = 'white'

## Background color of the statusbar in passthrough mode.
## Type: QssColor
# c.colors.statusbar.passthrough.bg = 'darkblue'

## Foreground color of the statusbar in passthrough mode.
## Type: QssColor
# c.colors.statusbar.passthrough.fg = 'white'

## Background color of the statusbar in private browsing mode.
## Type: QssColor
# c.colors.statusbar.private.bg = '#666666'

## Foreground color of the statusbar in private browsing mode.
## Type: QssColor
# c.colors.statusbar.private.fg = 'white'

## Background color of the progress bar.
## Type: QssColor
# c.colors.statusbar.progress.bg = 'white'

## Foreground color of the URL in the statusbar on error.
## Type: QssColor
# c.colors.statusbar.url.error.fg = 'orange'

## Default foreground color of the URL in the statusbar.
## Type: QssColor
# c.colors.statusbar.url.fg = 'white'

## Foreground color of the URL in the statusbar for hovered links.
## Type: QssColor
# c.colors.statusbar.url.hover.fg = 'aqua'

## Foreground color of the URL in the statusbar on successful load
## (http).
## Type: QssColor
# c.colors.statusbar.url.success.http.fg = 'white'

## Foreground color of the URL in the statusbar on successful load
## (https).
## Type: QssColor
# c.colors.statusbar.url.success.https.fg = 'lime'

## Foreground color of the URL in the statusbar when there's a warning.
## Type: QssColor
# c.colors.statusbar.url.warn.fg = 'yellow'

## Background color of the tab bar.
## Type: QssColor
# c.colors.tabs.bar.bg = '#555555'

## Background color of unselected even tabs.
## Type: QtColor
# c.colors.tabs.even.bg = 'darkgrey'

## Foreground color of unselected even tabs.
## Type: QtColor
# c.colors.tabs.even.fg = 'white'

## Color for the tab indicator on errors.
## Type: QtColor
# c.colors.tabs.indicator.error = '#ff0000'

## Color gradient start for the tab indicator.
## Type: QtColor
# c.colors.tabs.indicator.start = '#0000aa'

## Color gradient end for the tab indicator.
## Type: QtColor
# c.colors.tabs.indicator.stop = '#00aa00'

## Color gradient interpolation system for the tab indicator.
## Type: ColorSystem
## Valid values:
##   - rgb: Interpolate in the RGB color system.
##   - hsv: Interpolate in the HSV color system.
##   - hsl: Interpolate in the HSL color system.
##   - none: Don't show a gradient.
# c.colors.tabs.indicator.system = 'rgb'

## Background color of unselected odd tabs.
## Type: QtColor
# c.colors.tabs.odd.bg = 'grey'

## Foreground color of unselected odd tabs.
## Type: QtColor
# c.colors.tabs.odd.fg = 'white'

## Background color of pinned unselected even tabs.
## Type: QtColor
# c.colors.tabs.pinned.even.bg = 'darkseagreen'

## Foreground color of pinned unselected even tabs.
## Type: QtColor
# c.colors.tabs.pinned.even.fg = 'white'

## Background color of pinned unselected odd tabs.
## Type: QtColor
# c.colors.tabs.pinned.odd.bg = 'seagreen'

## Foreground color of pinned unselected odd tabs.
## Type: QtColor
# c.colors.tabs.pinned.odd.fg = 'white'

## Background color of pinned selected even tabs.
## Type: QtColor
# c.colors.tabs.pinned.selected.even.bg = 'black'

## Foreground color of pinned selected even tabs.
## Type: QtColor
# c.colors.tabs.pinned.selected.even.fg = 'white'

## Background color of pinned selected odd tabs.
## Type: QtColor
# c.colors.tabs.pinned.selected.odd.bg = 'black'

## Foreground color of pinned selected odd tabs.
## Type: QtColor
# c.colors.tabs.pinned.selected.odd.fg = 'white'

## Background color of selected even tabs.
## Type: QtColor
# c.colors.tabs.selected.even.bg = 'black'

## Foreground color of selected even tabs.
## Type: QtColor
# c.colors.tabs.selected.even.fg = 'white'

## Background color of selected odd tabs.
## Type: QtColor
# c.colors.tabs.selected.odd.bg = 'black'

## Foreground color of selected odd tabs.
## Type: QtColor
# c.colors.tabs.selected.odd.fg = 'white'

## Background color of tooltips. If set to null, the Qt default is used.
## Type: QssColor
# c.colors.tooltip.bg = None

## Foreground color of tooltips. If set to null, the Qt default is used.
## Type: QssColor
# c.colors.tooltip.fg = None

## Background color for webpages if unset (or empty to use the theme's
## color).
## Type: QtColor
# c.colors.webpage.bg = 'white'

# Darkmode
c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
c.colors.webpage.darkmode.contrast = 0.0
c.colors.webpage.darkmode.enabled = False # for some reason, it has to be set to false to work?
c.colors.webpage.darkmode.policy.images = 'smart-simple'
c.colors.webpage.darkmode.policy.page = 'always'
c.colors.webpage.darkmode.threshold.background = 0
c.colors.webpage.darkmode.threshold.foreground = 256
c.colors.webpage.preferred_color_scheme = 'dark'

## Default filesystem autocomplete suggestions for :open. The elements of
## this list show up in the completion window under the Filesystem
## category when the command line contains `:open` but no argument.
## Type: List of String
# c.completion.favorite_paths = []

## Height (in pixels or as percentage of the window) of the completion.
## Type: PercOrInt
# c.completion.height = '50%'

## Padding (in pixels) of the scrollbar handle in the completion window.
## Type: Int
# c.completion.scrollbar.padding = 2

## Width (in pixels) of the scrollbar in the completion window.
## Type: Int
# c.completion.scrollbar.width = 12

c.content.autoplay = False

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

## Display PDF files via PDF.js in the browser without showing a download
## prompt. Note that the files can still be downloaded by clicking the
## download button in the pdf.js viewer. With this set to `false`, the
## `:prompt-open-download --pdfjs` command (bound to `<Ctrl-p>` by
## default) can be used in the download prompt.
## Type: Bool
# c.content.pdfjs = False

c.content.user_stylesheets = ["~/.config/qutebrowser/styles/youtube.css",
                              "~/.config/qutebrowser/styles/theme.css"]

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

## CSS border value for hints.
## Type: String
# c.hints.border = '1px solid #E3BE23'

## Padding (in pixels) for hints.
## Type: Padding
# c.hints.padding = {'top': 0, 'bottom': 0, 'left': 3, 'right': 3}

## Rounding radius (in pixels) for the edges of hints.
## Type: Int
# c.hints.radius = 3

## Interpret number prefixes as counts for bindings. This enables for vi-
## like bindings that can be prefixed with a number to indicate a count.
## Disabling it allows for emacs-like bindings where number keys are
## passed through (according to `input.forward_unbound_keys`) instead.
## Type: Bool
# c.input.match_counts = True

## Rounding radius (in pixels) for the edges of the keyhint dialog.
## Type: Int
# c.keyhint.radius = 6

## Rounding radius (in pixels) for the edges of prompts.
## Type: Int
# c.prompt.radius = 8

## Force a Qt platformtheme to use. This sets the `QT_QPA_PLATFORMTHEME`
## environment variable which controls dialogs like the filepicker. By
## default, Qt determines the platform theme based on the desktop
## environment.
## Type: String
# c.qt.force_platformtheme = None

## When/how to show the scrollbar.
## Type: String
## Valid values:
##   - always: Always show the scrollbar.
##   - never: Never show the scrollbar.
##   - when-searching: Show the scrollbar when searching for text in the webpage. With the QtWebKit backend, this is equal to `never`.
##   - overlay: Show an overlay scrollbar. On macOS, this is unavailable and equal to `when-searching`; with the QtWebKit backend, this is equal to `never`. Enabling/disabling overlay scrollbars requires a restart.
# c.scrolling.bar = 'overlay'

## Enable smooth scrolling for web pages. Note smooth scrolling does not
## work with the `:scroll-px` command.
## Type: Bool
# c.scrolling.smooth = False

# Status bar
c.statusbar.padding = {'top': 1, 'bottom': 1, 'left': 0, 'right': 0}
c.statusbar.position = 'bottom'
c.statusbar.show = 'always'
c.statusbar.widgets = ['keypress', 'search_match', 'url', 'scroll', 'history', 'tabs', 'progress']

## Padding (in pixels) for tab indicators.
## Type: Padding
# c.tabs.indicator.padding = {'top': 2, 'bottom': 2, 'left': 0, 'right': 4}

## Width (in pixels) of the progress indicator (0 to disable).
## Type: Int
# c.tabs.indicator.width = 3

## Maximum width (in pixels) of tabs (-1 for no maximum). This setting
## only applies when tabs are horizontal. This setting does not apply to
## pinned tabs, unless `tabs.pinned.shrink` is False. This setting may
## not apply properly if max_width is smaller than the minimum size of
## tab contents, or smaller than tabs.min_width.
## Type: Int
# c.tabs.max_width = -1

## Minimum width (in pixels) of tabs (-1 for the default minimum size
## behavior). This setting only applies when tabs are horizontal. This
## setting does not apply to pinned tabs, unless `tabs.pinned.shrink` is
## False.
## Type: Int
# c.tabs.min_width = -1

## Padding (in pixels) around text for tabs.
## Type: Padding
# c.tabs.padding = {'top': 0, 'bottom': 0, 'left': 5, 'right': 5}

## Alignment of the text inside of tabs.
## Type: TextAlignment
## Valid values:
##   - left
##   - right
##   - center
# c.tabs.title.alignment = 'left'

## Position of ellipsis in truncated title of tabs.
## Type: ElidePosition
## Valid values:
##   - left
##   - right
##   - middle
##   - none
# c.tabs.title.elide = 'right'

c.tabs.title.format = '{private}{audio}{perc}{index}: {current_title}'

## Width (in pixels or as percentage of the window) of the tab bar if
## it's vertical.
## Type: PercOrInt
# c.tabs.width = '15%'

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

## Hide the window decoration.  This setting requires a restart on
## Wayland.
## Type: Bool
# c.window.hide_decoration = False

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
