vim.cmd('source ~/.config/nvim/init.vim')

require("mason").setup()
require("mason-lspconfig").setup()

-- Python
require("lspconfig").pyright.setup{}
