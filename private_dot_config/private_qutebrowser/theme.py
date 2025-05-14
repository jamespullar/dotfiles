# vim:fileencoding=utf-8:foldmethod=marker

##########
# Colors #
##########

# palette {{{
palette = {
    "transparent": "#00000000",
    "active-tab": "#5A5A5A",
    "indicator-tab": "#A532F5",
}
# }}}


###################
# Theme & Styling #
###################


# tabs {{{

# Hide the tab bar if only one tab is open
c.tabs.show = "multiple"

# Return to start page if all tabs are closed
c.tabs.last_close = "startpage"

# Enable tooltips on tabs
c.tabs.tooltips = True

# Enable vertical tabs
c.tabs.position = "left"

# Always show favicons
c.tabs.favicons.show = "always"

# Hide tab text
c.tabs.title.format = ""
c.tabs.title.format_pinned = ""

c.tabs.width = 40
c.tabs.padding = {"top": 10, "bottom": 10, "left": 10, "right": 10}

c.colors.tabs.bar.bg = palette["transparent"]

c.colors.tabs.even.bg = palette["transparent"]
c.colors.tabs.odd.bg = palette["transparent"]

c.colors.tabs.even.fg = palette["transparent"]
c.colors.tabs.odd.fg = palette["transparent"]

c.colors.tabs.selected.even.bg = palette["active-tab"]
c.colors.tabs.selected.odd.bg = palette["active-tab"]

c.colors.tabs.selected.even.fg = palette["active-tab"]
c.colors.tabs.selected.odd.fg = palette["active-tab"]

# Don't show a gradient on the tab indicator
c.colors.tabs.indicator.system = "none"
c.colors.tabs.indicator.start = palette["indicator-tab"]
c.colors.tabs.indicator.stop = palette["indicator-tab"]

# }}}

# status bar {{{

c.statusbar.position = "bottom"
c.statusbar.show = "in-mode"

c.colors.statusbar.normal.bg = palette["transparent"]

# }}}

