for i = 1, 9 do
local mark_char = string.char(64 + i) -- A=65, B=66, etc.
vim.keymap.set("n", "<leader>" .. i, function()
  local mark_pos = vim.api.nvim_get_mark(mark_char, {})
    if mark_pos[1] == 0 then
      vim.cmd("normal! gg")
      vim.cmd("mark " .. mark_char)
      vim.cmd("normal! ``") -- Jump back to where we were
    else
      vim.cmd("normal! `" .. mark_char) -- Jump to the bookmark
      vim.cmd('normal! `"') -- Jump to the last cursor position before leaving
    end
  end, { desc = "Toggle mark " .. mark_char })
end

-- Delete mark from current buffer
vim.keymap.set("n", "<leader>bd", function()
  for i = 1, 9 do
    local mark_char = string.char(64 + i)
    local mark_pos = vim.api.nvim_get_mark(mark_char, {})

    -- Check if mark is in current buffer
    if mark_pos[1] ~= 0 and vim.api.nvim_get_current_buf() == mark_pos[3] then
      vim.cmd("delmarks " .. mark_char)
    end
  end
end, { desc = "Delete mark" })

-- List bookmarks
local function list_bookmarks()
  local snacks = require("snacks")
  return snacks.picker.marks({ filter_marks = "A-I" })
end
vim.keymap.set("n", "<leader>fh", list_bookmarks, { desc = "List bookmarks" })
