# vim:fileencoding=utf-8:foldmethod=marker
c = c # noqa: F821 pylint: disable=E0602,C0103

import os
from urllib.request import urlopen


# load your autoconfig
config.load_autoconfig()


# settings {{{

# Always restore open sites
c.auto_save.session = True

c.url.start_pages = ["qute://bookmarks/"]

c.colors.webpage.darkmode.policy.images = "never"

c.url.searchengines = {
    'DEFAULT': 'http://search.home/search?q={}'
}

c.scrolling.smooth = True

c.qt.force_software_rendering = 'none'
c.content.webgl = False
c.content.autoplay = False

# Enable WebGL only for specific trusted sites
config.set('content.webgl', True, '*://underscorecraft.com:8123/*')
config.set('content.webgl', True, '*://alltrails.com/*')

# }}}


# Load theme
config.source('theme.py')

