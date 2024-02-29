return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      mappings = {
        ["l"] = "open",
        ["s"] = "open_split",
        ["v"] = "open_vsplit",
      },
    },
    filesystem = {
      filtered_items = {
        hide_gitignored = false,
      },
      hide_by_name = {
        "node_modules",
      },
      always_show = {
        ".gitignored",
        ".env",
      },
      never_show = {
        ".DS_Store",
      },
    },
    follow_current_file = {
      enabled = true,
      leave_dirs_open = true,
    },
  },
}
