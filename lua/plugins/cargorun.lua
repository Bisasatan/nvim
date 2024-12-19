local function cargo_run()
  local term_buf = vim.api.nvim_create_buf(false, true) -- Create a new scratch buffer
  local term_win = vim.api.nvim_open_win(term_buf, true, {
    relative = "editor",
    width = math.floor(vim.o.columns * 0.8), -- 80% width of the editor
    height = math.floor(vim.o.lines * 0.3), -- 30% height of the editor
    row = math.floor(vim.o.lines * 0.7), -- Bottom 30% of the screen
    col = math.floor(vim.o.columns * 0.1), -- Center horizontally
    style = "minimal",
  })

  -- Run `cargo run` in the terminal
  vim.fn.termopen("cargo run", {
    on_exit = function(_, exit_code)
      vim.api.nvim_buf_delete(term_buf, { force = true })
    end,
  })

  -- Auto-close the terminal window on exit
  vim.api.nvim_buf_set_option(term_buf, "bufhidden", "wipe")
  vim.api.nvim_win_set_option(term_win, "winhighlight", "Normal:NormalFloat")
end

-- Set the keymap in a way LazyVim recognizes it
vim.keymap.set("n", "<leader>cr", cargo_run, { noremap = true, silent = true })
