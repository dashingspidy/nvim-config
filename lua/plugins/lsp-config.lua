return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.ruby_lsp.setup({
        capabilities = capabilities,
        on_attach = on_attach
      })
      lspconfig.emmet_language_server.setup({
        capabilities = capabilities,
        on_attach = on_attach
      })
      lspconfig.dockerls.setup({
        capabilities = capabilities,
        on_attach = on_attach
      })
      lspconfig.tsserver.setup({
        capabilities = capabilities,
        on_attach = on_attach
      })
      lspconfig.pyright.setup({
        capabilities = capabilities,
        on_attach = on_attach
      })
      lspconfig.elixirls.setup({
        cmd = { "elixir-ls"},
        capabilities = capabilities,
        on_attach = on_attach
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
