function ColorMyPencils(color)
	color = color or "onedark_dark"
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})
    vim.api.nvim_set_hl(0, "LineNr", { fg = "none", bg="none"})
    vim.api.nvim_set_hl(0, "ColorColumn", { ctermbg=0, bg='#2a2a2a'})
end

ColorMyPencils()
