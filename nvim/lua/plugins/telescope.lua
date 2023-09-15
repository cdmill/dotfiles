return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      file_ignore_patterns = {
        "%.aux",
        "%.log",
        "%.xdv",
        "%.lof",
        "%.lot",
        "%.fls",
        "%.out",
        "%.toc",
        "%.fmt",
        "%.fot",
        "%.cb",
        "%.cb2",
        "%.*%.lb",
        "__latex*",
        "%.fdb_latexmk",
        "%.synctex",
        "%.synctex(busy)",
        "%.synctex.gz",
        "%.synctex.gz(busy)",
        "%.pdfsync",
        "%.pygstyle",
        "%.bbl",
        "%.bcf",
        "%.blg",
        "%.run.xml",
        "indent.log",
        "%.pdf",
      },
    },
  },
}
