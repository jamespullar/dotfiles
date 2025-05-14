# vim:fileencoding=utf-8:foldmethod=marker
c = c # noqa: F821 pylint: disable=E0602,C0103

import os
from urllib.request import urlopen

# load your autoconfig
config.load_autoconfig()

# settings {{{

# Always restore open sites
c.auto_save.session = True

# 
c.url.start_pages = ["qute://bookmarks/"]

# }}}


# Load theme
config.source('theme.py')

