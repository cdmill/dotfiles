return {
  "nvimdev/dashboard-nvim",
  opts = function()
    --     local logo = [[
    --          ▄▄▄▄▄
    --     ▄▄█  █▄         ▄▄▄
    --  ▄▄▄ ▄   █   ▄▄▄▄▄ ▄▄▄ ▄▄▄ ▄
    --  █▄█ █   █   ▄▄▄ █ █ █ █▄█ █
    --    █▄█▄▄ █▄▄ █▄█ █ ▄▄█ ▄▄█▄█
    --    █ █▄█ █▄█ █▄▄▄█ █▄█ █▄█ █
    -- ]]
    local logo = [[


███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
                                                  

    ]]
    logo = string.rep("\n", 8) .. logo .. "\n\n"

    local opts = {
      theme = "doom",
      hide = {
        statusline = true,
      },
      config = {
        header = vim.split(logo, "\n"),
        -- stylua: ignore
        center = {
          { action = "Telescope find_files",              desc = " Find file",       icon = " ", key = "f" },
          { action = "Oil",                               desc = " File Explorer",   icon = " ", key = "e" },
          { action = "Telescope live_grep",               desc = " Find text",       icon = " ", key = "g" },
          { action = "Telescope oldfiles cwd_only=true",  desc = " Recent files",    icon = " ", key = "r" },
          { action = "Lazy",                              desc = " Lazy",            icon = "󰒲 ", key = "l" },
          { action = "qa",                                desc = " Quit",            icon = " ", key = "q" },
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return {
            "󱐋 Neovim loaded "
              .. stats.loaded
              .. "/"
              .. stats.count
              .. " plugins in "
              .. ms
              .. "ms",
          }
        end,
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
    end

    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "DashboardLoaded",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    return opts
  end,
}
