local searchDirs = {
  "~/.oh-my-zsh/custom/",
  "~/.config/nvim",
  "~/.hammerspoon/",
  "~/.config/atuin/atuin.zshrc",
  "~/.config/nvim/lua/custom",
  "~/.config/alacritty",
  "~/.config/yabai",
  "~/.config/scripts",
  "~/.config/lazygit",
  "~/.config/nixpkgs",
  "~/.config/my-snippets",
  "~/.config/espanso/match/base.yml",
  "~/.zshrc",
  "~/.gitconfig",
  "~/.config/wezterm",
  "~/.skhdrc",
  "~/.tmux.conf",
  "~/dotFilesConfig.sh",
  "~/readme.md",
  "~/.bash_profile",
}

local noteVaults = {
  "~/NotesVault/",
}

return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      mappings = {
        n = { ["q"] = require("telescope.actions").close },
        i = {
          ["<esc>"] = require("telescope.actions").close,
          -- ["<C-n>"] = false,
          -- ["<C-p>"] = false,
          ["<C-j>"] = require("telescope.actions").move_selection_next,
          ["<C-k>"] = require("telescope.actions").move_selection_previous,
        },
      },
    },
    pickers = {
      oldfiles = {
        sort_lastused = true,
        theme = "ivy",
        layout_config = {
          height = 12,
        },
        previewer = false,
      },
      lsp_document_symbols = {
        previewer = false,
        symbols = { "method", "class" },
        layout_config = {
          height = 20,
          width = 0.4,
        },
      },
      buffers = {
        path_display = { "smart" },
        sort_lastused = true,
        ignore_current_buffer = true,
        theme = "dropdown",
        layout_config = {
          height = 12,
        },
        previewer = false,
      },
      find_files = {
        path_display = { "smart" },
        previewer = false,
        layout_config = {
          height = 0.3,
          width = 0.4,
        },
      },
      git_files = {
        path_display = { "smart" },
        previewer = false,
        layout_config = {
          height = 0.3,
          width = 0.4,
        },
      },
    },
  },
  keys = {
    -- disable the keymap to grep files
    { "<leader>/", false },
    -- find in dotfiles
    {
      "<leader>f.",
      desc = "find dotfiles",
      function()
        require("telescope.builtin").find_files({
          prompt_title = "Config Find",
          results_title = nil,
          path_display = { "truncate" },
          search_dirs = searchDirs,
          cwd = "~/.config/",
          layout_strategy = "horizontal",
          layout_config = { preview_width = 0.6, width = 0.75, height = 0.5 },
        })
      end,
    },
    -- search dotfiles
    {
      "<leader>f,",
      desc = "search dotfiles",
      function()
        require("telescope.builtin").live_grep({
          prompt_title = "Config Search",
          results_title = nil,
          path_display = { "smart" },
          search_dirs = searchDirs,
          cwd = "~/.config/",
          layout_strategy = "horizontal",
          layout_config = { preview_width = 0.6, width = 0.75, height = 0.5 },
        })
      end,
    },
    --- Search notes
    {
      "<leader>sn",
      desc = "search dotfiles",
      function()
        require("telescope.builtin").live_grep({
          prompt_title = "Search notes",
          results_title = nil,
          path_display = { "smart" },
          search_dirs = noteVaults,
          cwd = "~/.config/",
          layout_strategy = "horizontal",
          layout_config = { preview_width = 0.6, width = 0.75, height = 0.5 },
        })
      end,
    },
    --
    {
      "<leader>fp",
      function()
        require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
      end,
      desc = "Find Plugin File",
    },
  },
}
