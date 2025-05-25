return {
    "fatih/vim-go",
    ft = {"go"},    -- Load only for Go files
    build = ":GoInstallBinaries",   -- Install Go binaries after loading
    config = function()
        vim.g.go_term_enabled = 1
        vim.g.go_term_mode = "split"
        vim.g.go_term_close_on_exit = 1
        vim.g.go_term_height = 15
        vim.g.go_term_reuse = 1

        -- Create autocmd to ensure terminal is always at the bottom
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "go",
            callback = function()
              -- Hook into GoRun to make sure terminal opens at bottom
              vim.api.nvim_create_autocmd("User", {
                pattern = "GoRunPre",
                callback = function()
                  -- Store current window to return to it
                  vim.g.go_previous_window = vim.api.nvim_get_current_win()
                end
              })
              
              vim.api.nvim_create_autocmd("User", {
                pattern = "GoRunPost",
                callback = function()
                  -- If terminal opened, move it to the bottom
                  vim.cmd("wincmd J")  -- Move to bottom
                  -- Return to the previous window
                  if vim.g.go_previous_window then
                    vim.api.nvim_set_current_win(vim.g.go_previous_window)
                  end
                end
              })
            end
        })

        vim.g.go_fmt_command = "goimports"
        vim.g.go_highlight_types = 1
        vim.g.go_highlight_fields = 1
        vim.g.go_highlight_functions = 1
    end,
}
