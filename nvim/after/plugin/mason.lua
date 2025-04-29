require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

local servers = { 'lua_ls', 'pyright', 'rust_analyzer', 'clangd', 'html' }


require("mason-lspconfig").setup {
    ensure_installed = servers
}

local opts = { noremap=true, silent=true }

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

for _, lsp in pairs(servers) do
	require('lspconfig')[lsp].setup {
			on_attach = on_attach,
			flags = {
					debounce_text_changes = 150,
			}
	}
end

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
cmp.setup({
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
    {name = 'luasnip', keyword_length = 2},
    {name = 'buffer', keyword_length = 3},
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
})


require('lean').setup{
  -- Enable the Lean language server(s)?
  --
  -- false to disable, otherwise should be a table of options to pass to `leanls`
  --
  -- See https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#leanls for details.
  -- In particular ensure you have followed instructions setting up a callback
  -- for `LspAttach` which sets your key bindings!
  lsp = {
    init_options = {
      -- See Lean.Lsp.InitializationOptions for details and further options.

      -- Time (in milliseconds) which must pass since latest edit until elaboration begins.
      -- Lower values may make editing feel faster at the cost of higher CPU usage.
      -- Note that lean.nvim changes the Lean default for this value!
      editDelay = 0,

      -- Whether to signal that widgets are supported.
      hasWidgets = true,
    }
  },

  ft = {
    -- A list of patterns which will be used to protect any matching
    -- Lean file paths from being accidentally modified (by marking the
    -- buffer as `nomodifiable`).
    nomodifiable = {
        -- by default, this list includes the Lean standard libraries,
        -- as well as files within dependency directories (e.g. `_target`)
        -- Set this to an empty table to disable.
    }
  },

  -- Abbreviation support
  abbreviations = {
    -- Enable expanding of unicode abbreviations?
    enable = true,
    -- additional abbreviations:
    extra = {
      -- Add a \wknight abbreviation to insert ♘
      --
      -- Note that the backslash is implied, and that you of
      -- course may also use a snippet engine directly to do
      -- this if so desired.
      wknight = '♘',
    },
    -- Change if you don't like the backslash
    -- (comma is a popular choice on French keyboards)
    leader = '\\',
  },

  -- Enable suggested mappings?
  --
  -- false by default, true to enable
  mappings = false,

  -- Infoview support
  infoview = {
    -- Automatically open an infoview on entering a Lean buffer?
    -- Should be a function that will be called anytime a new Lean file
    -- is opened. Return true to open an infoview, otherwise false.
    -- Setting this to `true` is the same as `function() return true end`,
    -- i.e. autoopen for any Lean file, or setting it to `false` is the
    -- same as `function() return false end`, i.e. never autoopen.
    autoopen = true,

    -- Set infoview windows' starting dimensions.
    -- Windows are opened horizontally or vertically depending on spacing.
    width = 50,
    height = 20,

    -- Put the infoview on the top or bottom when horizontal?
    -- top | bottom
    horizontal_position = "bottom",

    -- Always open the infoview window in a separate tabpage.
    -- Might be useful if you are using a screen reader and don't want too
    -- many dynamic updates in the terminal at the same time.
    -- Note that `height` and `width` will be ignored in this case.
    separate_tab = false,

    -- Show indicators for pin locations when entering an infoview window?
    -- always | never | auto (= only when there are multiple pins)
    indicators = "auto",
  },

  -- Progress bar support
  progress_bars = {
    -- Enable the progress bars?
    -- By default, this is `true` if satellite.nvim is not installed, otherwise
    -- it is turned off, as when satellite.nvim is present this information would
    -- be duplicated.
    enable = true,  -- see above for default
    -- What character should be used for the bars?
    character = '│',
    -- Use a different priority for the signs
    priority = 10,
  },

  -- Redirect Lean's stderr messages somehwere (to a buffer by default)
  stderr = {
    enable = true,
    -- height of the window
    height = 5,
    -- a callback which will be called with (multi-line) stderr output
    -- e.g., use:
    --   on_lines = function(lines) vim.notify(lines) end
    -- if you want to redirect stderr to `vim.notify`.
    -- The default implementation will redirect to a dedicated stderr
    -- window.
    on_lines = nil,
  },
}

