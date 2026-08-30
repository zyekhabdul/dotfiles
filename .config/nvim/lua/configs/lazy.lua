return {
  defaults = { lazy = true },
  install = { colorscheme = { "nvchad" } },
  git = {
    url_format = "https://github.com/%s.git",
    options = {
      "-c",
      "url.git@github.com:.insteadOf=",
      "-c",
      "url.git@gitlab.com:.insteadOf=",
      "-c",
      "url.git@codeberg.org:.insteadOf=",
    },
  },

  ui = {
    icons = {
      ft = "",
      lazy = "󰂠 ",
      loaded = "",
      not_loaded = "",
    },
  },

  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
      },
    },
  },
}
