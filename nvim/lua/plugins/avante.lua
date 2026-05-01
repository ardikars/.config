vim.pack.add({
    {
        src = 'https://github.com/yetone/avante.nvim',
        version = '6c00a52cb487bb18ea2413dc95a835c7c91db912'
    },
})

require('avante').setup({
    provider = "openai",
    auto_suggestions_provider = "openai",

    providers = {
        openai = {
            endpoint = "https://openrouter.ai/api/v1",
            model = "openai/gpt-oss-120b:free",
            timeout = 30000,
            extra_request_body = {
                temperature = 0,
                max_tokens = 4096,
            },
        },
    },
})
