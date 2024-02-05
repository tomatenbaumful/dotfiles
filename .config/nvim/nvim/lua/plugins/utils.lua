return {
  {
    'numToStr/Comment.nvim',
    opts = {},
    lazy = false,
  },
  {'justinmk/vim-sneak'},
  {
    'echasnovski/mini.move',
    config = function()
      require("mini.move").setup()
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      vim.keymap.set('n', '<leader>g', '<cmd>:LazyGit<CR>')
    end
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      vim.keymap.set('n', '<leader>v', '<cmd>:Neotree toggle<CR>')
    end
  },
}
