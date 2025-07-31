import rosepine

c = c
config = config
config.load_autoconfig(False)

# --- UI color settings

rosepine.moon(c)
c.colors.webpage.darkmode.enabled = True

# --- Content settings

# Block subdomains of blocked hosts.
c.content.blocking.hosts.block_subdomains = True
# Which method of blocking ads should be used. Support for Adblock Plus
# (ABP) syntax blocklists using Brave's Rust library requires the
# `adblock` Python package to be installed, which is an optional
# dependency of qutebrowser.
c.content.blocking.method = 'both'
# Automatically start playing `<video>` elements.
c.content.autoplay = False
# Limit fullscreen to the browser window (does not expand to fill the screen).
c.content.fullscreen.window = True
# Allow websites to request geolocations.
c.content.geolocation = False
# Enable WebGL.
c.content.webgl = False
# Allow websites to lock your mouse pointer.
c.content.mouse_lock = False
# Allow websites to show notifications.
c.content.notifications.enabled = False
# Allow websites to request persistent storage quota via `navigator.webkitPersistentStorage.requestQuota`.
c.content.persistent_storage = False
# Allow websites to register protocol handlers via `navigator.registerProtocolHandler`.
c.content.register_protocol_handler = False
# Allow JavaScript to read from or write to the clipboard.
c.content.javascript.clipboard = 'none'
# Show javascript prompts.
c.content.javascript.prompt = False
# How to proceed on TLS certificate errors.
c.content.tls.certificate_errors = 'block'
# List of URLs to ABP-style adblocking rulesets. Only used when Brave's
# ABP-style adblocker is used (see `content.blocking.method`).  You can
# find an overview of available lists here: https://adblockplus.org/en/subscriptions
c.content.blocking.adblock.lists = [
    'https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/annoyances.txt',
    'https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/badlists.txt',
    'https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/badware.txt',
    'https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters-2020.txt',
    'https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters-2021.txt',
    'https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt',
    'https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt',
    'https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/resource-abuse.txt',
    'https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/thirdparties/pgl.yoyo.org/as/serverlist',
    'https://easylist.to/easylist/easylist.txt',
    'https://easylist.to/easylist/easyprivacy.txt',
]

# --- General settings

# Height (in pixels or as percentage of the window) of the completion.
c.completion.height = '25%'
# Number of commands to save in the command history. 0: no history / -1: unlimited
c.completion.cmd_history_max_items = 100
# Number of URLs to show in the web history. 0: no history / -1: unlimited
c.completion.web_history.max_items = 100
# Width (in pixels) of the scrollbar in the completion window.
c.completion.scrollbar.width = 4
# Which categories to show (in which order) in the :open completion.
c.completion.open_categories = ['history', 'bookmarks']
# Remember the last used download directory.
c.downloads.location.remember = False
# Where to show the downloaded files.
c.downloads.position = 'bottom'
# Disable accelerated 2d canvas to avoid graphical glitches.
c.qt.workarounds.disable_accelerated_2d_canvas = 'always'
# Disable the Hangouts extension.
c.qt.workarounds.disable_hangouts_extension = True
# When/how to show the scrollbar.
c.scrolling.bar = 'when-searching'
# List of widgets displayed in the statusbar.
c.statusbar.widgets = ['keypress', 'search_match', 'scroll', 'history', 'progress']
# Mouse button with which to close tabs.
c.tabs.close_mouse_button = 'none'
# How to behave when the close mouse button is pressed on the tab bar.
c.tabs.close_mouse_button_on_bar = 'ignore'
# Switch between tabs using the mouse wheel.
c.tabs.mousewheel_switching = False
# Default zoom level.
c.zoom.default = '90%'
# Width (in pixels) of the progress indicator (0 to disable).
c.tabs.indicator.width = 0
# Padding (in pixels) around text for tabs.
c.tabs.padding = {'top': 7, 'bottom': 7, 'left': 10, 'right': 10}
# When to show the tab bar.
c.tabs.show = 'multiple'
# Hide the window decoration.
c.window.hide_decoration = True
# Editor (and arguments) to use for the `edit-*` commands.
c.editor.command = ['nvim', '+{line}', '{file}']

## Enable JavaScript.
# c.content.javascript.enabled = True
## Store cookies.
# c.content.cookies.store = True
## Enable hyperlink auditing (`<a ping>`).
# c.content.hyperlink_auditing = False
## Load images automatically in web pages.
# c.content.images = True
## Show javascript alerts.
# c.content.javascript.alert = True

## List of URLs to host blocklists for the host blocker.  Only used when
## the simple host-blocker is used (see `content.blocking.method`).  The
## file can be in one of the following formats:  - An `/etc/hosts`-like
## file - One host per line - A zip-file of any of the above, with either
## only one file, or a file   named `hosts` (with any extension).  It's
## also possible to add a local file or directory via a `file://` URL. In
## case of a directory, all files in the directory are read as adblock
## lists.  The file `~/.config/qutebrowser/blocked-hosts` is always read
## if it exists.
## Type: List of Url
# c.content.blocking.hosts.lists = ['https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts']

## User agent to send.  The following placeholders are defined:  *
## `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
## The underlying WebKit version (set to a fixed value   with
## QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
## QtWebEngine. * `{qt_version}`: The underlying Qt version. *
## `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
## QtWebEngine. * `{upstream_browser_version}`: The corresponding
## Safari/Chrome version. * `{upstream_browser_version_short}`: The
## corresponding Safari/Chrome   version, but only with its major
## version. * `{qutebrowser_version}`: The currently running qutebrowser
## version.  The default value is equal to the default user agent of
## QtWebKit/QtWebEngine, but with the `QtWebEngine/...` part removed for
## increased compatibility.  Note that the value read from JavaScript is
## always the global value.
## Type: FormatString
# c.content.headers.user_agent = 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version_short} Safari/{webkit_version}'

## Display PDF files via PDF.js in the browser without showing a download
## prompt. Note that the files can still be downloaded by clicking the
## download button in the pdf.js viewer. With this set to `false`, the
## `:prompt-open-download --pdfjs` command (bound to `<Ctrl-p>` by
## default) can be used in the download prompt.
## Type: Bool
# c.content.pdfjs = False

## Disable a list of named quirks.
## Type: FlagList
## Valid values:
##   - ua-google
##   - ua-googledocs
##   - js-whatsapp-web
##   - js-discord
##   - js-string-replaceall
##   - js-array-at
##   - misc-krunker
##   - misc-mathml-darkmode
# c.content.site_specific_quirks.skip = []

## Languages to use for spell checking. You can check for available
## languages and install dictionaries using scripts/dictcli.py. Run the
## script with -h/--help for instructions.
## Type: List of String
## Valid values:
##   - el-GR: Greek (Greece)
##   - en-GB: English (United Kingdom)
# c.spellcheck.languages = []

# Search engines which can be used via the address bar.
c.url.searchengines['DEFAULT'] = 'https://duckduckgo.com/?q={}'
c.url.searchengines['a'] = 'https://wiki.archlinux.org/?search={}'
c.url.searchengines['g'] = 'https://github.com/search?q={}&type=repositories'
c.url.searchengines['y'] = 'https://yewtu.be/search?q={}'

# Bindings for normal mode
config.unbind('Sb')
config.unbind('Sq')
config.bind('<Ctrl-Shift-Tab>', 'tab-prev')
config.bind('<Ctrl-Tab>', 'tab-next')
config.bind('<Ctrl-Q>', 'nop')
config.bind('<Ctrl-V>', 'nop')
config.bind('J', 'nop')
config.bind('K', 'nop')
config.bind('m', 'bookmark-add')
config.bind('M', 'bookmark-del')
config.bind('b', 'bookmark-load')
config.bind('B', 'bookmark-load -t')
config.bind('gb', 'bookmark-list -t')
