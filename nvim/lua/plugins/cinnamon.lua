vim.pack.add({
    {
        src = 'https://github.com/declancm/cinnamon.nvim',
        version = '450cb3247765fed7871b41ef4ce5fa492d834215'
    },
})

local cinnamon = require("cinnamon")

cinnamon.setup({
    disabled = false,
    keymaps = {
        basic = false,
        extra = false,
    },
    delay = 1000,
    ---@class ScrollOptions
    options = {
        -- The scrolling mode
        -- `cursor`: animate cursor and window scrolling for any movement
        -- `window`: animate window scrolling ONLY when the cursor moves out of view
        mode = "cursor",

        -- Only animate scrolling if a count is provided
        count_only = false,

        -- Delay between each movement step (in ms)
        delay = 5,

        max_delta = {
            -- Maximum distance for line movements before scroll
            -- animation is skipped. Set to `false` to disable
            line = false,
            -- Maximum distance for column movements before scroll
            -- animation is skipped. Set to `false` to disable
            column = false,
            -- Maximum duration for a movement (in ms). Automatically scales the
            -- delay and step size
            time = 1000,
        },

        step_size = {
            -- Number of cursor/window lines moved per step
            vertical = 1,
            -- Number of cursor/window columns moved per step
            horizontal = 2,
        },

        -- Optional post-movement callback. Not called if the movement is interrupted
        callback = function() end,
    },
})

local keymap = {
    ["<A-k>"] = function() cinnamon.scroll("5k") end,
    ["<A-j>"] = function() cinnamon.scroll("5j") end,
    ["<A-l>"] = function() cinnamon.scroll("5l") end,
    ["<A-h>"] = function() cinnamon.scroll("5h") end,
}

local modes = { 'n', 'v', 'x' }
for key, func in pairs(keymap) do
    vim.keymap.set(modes, key, func)
end
