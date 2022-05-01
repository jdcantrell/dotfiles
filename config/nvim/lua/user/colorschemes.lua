require("themer").setup({
    colorscheme = "rose_pine",
    styles = {
        ["function"] = { style = 'italic' },
        functionbuiltin = { style = 'italic' },
        variable = { style = 'italic' },
        variableBuiltIn = { style = 'italic' },
        parameter  = { style = 'italic' },
    },
})

vim.cmd [[
try
  colorscheme themer_tokyonight
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]

