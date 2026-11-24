return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				-- python = { "isort", "black" },
				-- -- You can customize some of the format options for the filetype (:help conform.format)
				-- rust = { "rustfmt", lsp_format = "fallback" },
				-- -- Conform will run the first available formatter
				-- javascript = { "prettierd", "prettier", stop_after_first = true },
				-- yaml = { "yamlfix" },
				tex = { "latexindent", lsp_format = "never", async = true }, -- 'latexindent' missing to disable it
			},
			format_on_save = function(bufnr)
				local ext = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":e")
				if ext == "tex" then
					-- print("ft: " .. ext .. " -- format_on_save" .. vim.api.nvim_buf_get_name(bufnr))
					return nil
				else
					return { timeout_ms = 1000 }
				end
			end,
		},
	},
}
