{ pkgs, ... }:
{
  home.file = {
    ".config/qutebrowser/styles/youtube.css".source = ../../nyxt/youtube.css;
    ".config/qutebrowser/styles/theme.css".source = ../../nyxt/theme.css;
    ".config/qutebrowser/greasemonkey/yt-ads.js".source = ../../nyxt/yt-ads.js;
    ".config/qutebrowser/greasemonkey/yt-speed.js".source = ../../nyxt/yt-speed.js;
  };
  programs.qutebrowser = {
    enable = true;
    extraConfig = ''
      c.content.user_stylesheets = ["~/.config/qutebrowser/styles/youtube.css",
                                    "~/.config/qutebrowser/styles/theme.css"]

      # gruvbox dark hard qutebrowser theme by Florian Bruhin <me@the-compiler.org>
      #
      # Originally based on:
      #   base16-qutebrowser (https://github.com/theova/base16-qutebrowser)
      #   Base16 qutebrowser template by theova and Daniel Mulford
      #   Gruvbox dark, hard scheme by Dawid Kurek (dawikur@gmail.com), morhetz (https://github.com/morhetz/gruvbox)
                
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

      ### Completion

      # Text color of the completion widget. May be a single color to use for
      # all columns or a list of three colors, one for each column.
      c.colors.completion.fg = [fg1, bright_aqua, bright_yellow]

      # Background color of the completion widget for odd rows.
      c.colors.completion.odd.bg = bg0

      # Background color of the completion widget for even rows.
      c.colors.completion.even.bg = c.colors.completion.odd.bg

      # Foreground color of completion widget category headers.
      c.colors.completion.category.fg = bright_blue

      # Background color of the completion widget category headers.
      c.colors.completion.category.bg = bg1

      # Top border color of the completion widget category headers.
      c.colors.completion.category.border.top = c.colors.completion.category.bg

      # Bottom border color of the completion widget category headers.
      c.colors.completion.category.border.bottom = c.colors.completion.category.bg

      # Foreground color of the selected completion item.
      c.colors.completion.item.selected.fg = fg0

      # Background color of the selected completion item.
      c.colors.completion.item.selected.bg = bg4

      # Top border color of the selected completion item.
      c.colors.completion.item.selected.border.top = bg2

      # Bottom border color of the selected completion item.
      c.colors.completion.item.selected.border.bottom = c.colors.completion.item.selected.border.top

      # Foreground color of the matched text in the selected completion item.
      c.colors.completion.item.selected.match.fg = bright_orange

      # Foreground color of the matched text in the completion.
      c.colors.completion.match.fg = c.colors.completion.item.selected.match.fg

      # Color of the scrollbar handle in the completion view.
      c.colors.completion.scrollbar.fg = c.colors.completion.item.selected.fg

      # Color of the scrollbar in the completion view.
      c.colors.completion.scrollbar.bg = c.colors.completion.category.bg

      ### Context menu

      # Background color of disabled items in the context menu.
      c.colors.contextmenu.disabled.bg = bg3

      # Foreground color of disabled items in the context menu.
      c.colors.contextmenu.disabled.fg = fg3

      # Background color of the context menu. If set to null, the Qt default is used.
      c.colors.contextmenu.menu.bg = bg0

      # Foreground color of the context menu. If set to null, the Qt default is used.
      c.colors.contextmenu.menu.fg =  fg2

      # Background color of the context menu’s selected item. If set to null, the Qt default is used.
      c.colors.contextmenu.selected.bg = bg2

      #Foreground color of the context menu’s selected item. If set to null, the Qt default is used.
      c.colors.contextmenu.selected.fg = c.colors.contextmenu.menu.fg

      ### Downloads

      # Background color for the download bar.
      c.colors.downloads.bar.bg = bg0

      # Color gradient start for download text.
      c.colors.downloads.start.fg = bg0

      # Color gradient start for download backgrounds.
      c.colors.downloads.start.bg = bright_blue

      # Color gradient end for download text.
      c.colors.downloads.stop.fg = c.colors.downloads.start.fg

      # Color gradient stop for download backgrounds.
      c.colors.downloads.stop.bg = bright_aqua

      # Foreground color for downloads with errors.
      c.colors.downloads.error.fg = bright_red

      ### Hints

      # Font color for hints.
      c.colors.hints.fg = bg0

      # Background color for hints.
      c.colors.hints.bg = 'rgba(250, 191, 47, 200)'  # bright_yellow

      # Font color for the matched part of hints.
      c.colors.hints.match.fg = bg4

      ### Keyhint widget

      # Text color for the keyhint widget.
      c.colors.keyhint.fg = fg4

      # Highlight color for keys to complete the current keychain.
      c.colors.keyhint.suffix.fg = fg0

      # Background color of the keyhint widget.
      c.colors.keyhint.bg = bg0

      ### Messages

      # Foreground color of an error message.
      c.colors.messages.error.fg = bg0

      # Background color of an error message.
      c.colors.messages.error.bg = bright_red

      # Border color of an error message.
      c.colors.messages.error.border = c.colors.messages.error.bg

      # Foreground color of a warning message.
      c.colors.messages.warning.fg = bg0

      # Background color of a warning message.
      c.colors.messages.warning.bg = bright_purple

      # Border color of a warning message.
      c.colors.messages.warning.border = c.colors.messages.warning.bg

      # Foreground color of an info message.
      c.colors.messages.info.fg = fg2

      # Background color of an info message.
      c.colors.messages.info.bg = bg0

      # Border color of an info message.
      c.colors.messages.info.border = c.colors.messages.info.bg

      ### Prompts

      # Foreground color for prompts.
      c.colors.prompts.fg = fg2

      # Border used around UI elements in prompts.
      c.colors.prompts.border = f'1px solid {bg1}'

      # Background color for prompts.
      c.colors.prompts.bg = bg3

      # Background color for the selected item in filename prompts.
      c.colors.prompts.selected.bg = bg2

      ### Statusbar

      # Foreground color of the statusbar.
      c.colors.statusbar.normal.fg = fg2

      # Background color of the statusbar.
      c.colors.statusbar.normal.bg = bg0

      # Foreground color of the statusbar in insert mode.
      c.colors.statusbar.insert.fg = bg0

      # Background color of the statusbar in insert mode.
      c.colors.statusbar.insert.bg = dark_aqua

      # Foreground color of the statusbar in passthrough mode.
      c.colors.statusbar.passthrough.fg = bg0

      # Background color of the statusbar in passthrough mode.
      c.colors.statusbar.passthrough.bg = dark_blue

      # Foreground color of the statusbar in private browsing mode.
      c.colors.statusbar.private.fg = bright_purple

      # Background color of the statusbar in private browsing mode.
      c.colors.statusbar.private.bg = bg0

      # Foreground color of the statusbar in command mode.
      c.colors.statusbar.command.fg = fg3

      # Background color of the statusbar in command mode.
      c.colors.statusbar.command.bg = bg1

      # Foreground color of the statusbar in private browsing + command mode.
      c.colors.statusbar.command.private.fg = c.colors.statusbar.private.fg

      # Background color of the statusbar in private browsing + command mode.
      c.colors.statusbar.command.private.bg = c.colors.statusbar.command.bg

      # Foreground color of the statusbar in caret mode.
      c.colors.statusbar.caret.fg = bg0

      # Background color of the statusbar in caret mode.
      c.colors.statusbar.caret.bg = dark_purple

      # Foreground color of the statusbar in caret mode with a selection.
      c.colors.statusbar.caret.selection.fg = c.colors.statusbar.caret.fg

      # Background color of the statusbar in caret mode with a selection.
      c.colors.statusbar.caret.selection.bg = bright_purple

      # Background color of the progress bar.
      c.colors.statusbar.progress.bg = bright_blue

      # Default foreground color of the URL in the statusbar.
      c.colors.statusbar.url.fg = fg4

      # Foreground color of the URL in the statusbar on error.
      c.colors.statusbar.url.error.fg = dark_red

      # Foreground color of the URL in the statusbar for hovered links.
      c.colors.statusbar.url.hover.fg = bright_orange

      # Foreground color of the URL in the statusbar on successful load
      # (http).
      c.colors.statusbar.url.success.http.fg = bright_red

      # Foreground color of the URL in the statusbar on successful load
      # (https).
      c.colors.statusbar.url.success.https.fg = fg0

      # Foreground color of the URL in the statusbar when there's a warning.
      c.colors.statusbar.url.warn.fg = bright_purple

      ### tabs

      # Background color of the tab bar.
      c.colors.tabs.bar.bg = bg0

      # Color gradient start for the tab indicator.
      c.colors.tabs.indicator.start = bright_blue

      # Color gradient end for the tab indicator.
      c.colors.tabs.indicator.stop = bright_aqua

      # Color for the tab indicator on errors.
      c.colors.tabs.indicator.error = bright_red

      # Foreground color of unselected odd tabs.
      c.colors.tabs.odd.fg = fg2

      # Background color of unselected odd tabs.
      c.colors.tabs.odd.bg = bg2

      # Foreground color of unselected even tabs.
      c.colors.tabs.even.fg = c.colors.tabs.odd.fg

      # Background color of unselected even tabs.
      c.colors.tabs.even.bg = bg3

      # Foreground color of selected odd tabs.
      c.colors.tabs.selected.odd.fg = fg2

      # Background color of selected odd tabs.
      c.colors.tabs.selected.odd.bg = bg0

      # Foreground color of selected even tabs.
      c.colors.tabs.selected.even.fg = c.colors.tabs.selected.odd.fg

      # Background color of selected even tabs.
      c.colors.tabs.selected.even.bg = bg0

      # Background color of pinned unselected even tabs.
      c.colors.tabs.pinned.even.bg = bright_green

      # Foreground color of pinned unselected even tabs.
      c.colors.tabs.pinned.even.fg = bg2

      # Background color of pinned unselected odd tabs.
      c.colors.tabs.pinned.odd.bg = bright_green

      # Foreground color of pinned unselected odd tabs.
      c.colors.tabs.pinned.odd.fg = c.colors.tabs.pinned.even.fg

      # Background color of pinned selected even tabs.
      c.colors.tabs.pinned.selected.even.bg = bg0

      # Foreground color of pinned selected even tabs.
      c.colors.tabs.pinned.selected.even.fg = c.colors.tabs.selected.odd.fg

      # Background color of pinned selected odd tabs.
      c.colors.tabs.pinned.selected.odd.bg = c.colors.tabs.pinned.selected.even.bg

      # Fore color of pinned selected odd tabs.
      c.colors.tabs.pinned.selected.odd.fg = c.colors.tabs.selected.odd.fg

      # Background color for webpages if unset (or empty to use the theme's
      # color).
      # c.colors.webpage.bg = bg4

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
    '';
    quickmarks = {
      youtube = "https://www.youtube.com/";
      github = "https://github.com/dashboard";
      nixpkgs = "https://search.nixos.org/packages?";
      nixoptions = "https://search.nixos.org/options?";
      nixhmoptions = "https://home-manager-options.extranix.com/?query=&release=master";
      melpa = "https://melpa.org/#/";
      gpacalc = "https://gpacalculator.net/college-gpa-calculator/";
      indeed = "https://www.indeed.com/?from=notifcenter_webapp_zero_notifications_page";
      mycotc = "https://experience.elluciancloud.com/cotc/";
      calendar = "https://www.cotc.edu/sites/main/files/file-attachments/2024-2025_academic_calendar.pdf?1725366617";
      courses = "https://cotc.instructure.com/courses";
      yuzu = "https://reader.yuzu.com";
      gruvbox = "https://github.com/morhetz/gruvbox";
    };
  };
}
