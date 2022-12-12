local packer_installed, packer = pcall(require, 'packer')
if not packer_installed then
	vim.api.nvim_err_writeln('[modules.lsp.lspsaga-nvim] Packer not found')
	return
end

packer.use({
	'glepnir/lspsaga.nvim',
	disable = false,
	opt = false,
	requires = { 'neovim/nvim-lspconfig' },
	config = function()
		require('lspsaga').init_lsp_saga({
			vim.keymap.set('n', '<leader>li', '<cmd>Lspsaga implement<cr>', { silent = true, desc = 'lspsaga | Implement' }),

			vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', { silent = true, desc = 'lspsaga | Hover doc' }),

			vim.keymap.set(
				'x',
				'<leader>ca',
				'<cmd>Lspsaga range_code_action<cr>',
				{ silent = true, desc = 'lspsaga | Range code action' }
			),

			vim.keymap.set(
				'n',
				'<leader>lj',
				'<cmd>Lspsaga smart_scroll_with_saga(1)<cr>',
				{ silent = true, desc = 'lspsaga | Scroll hover doc next' }
			),

			vim.keymap.set(
				'n',
				'<leader>lk',
				'<cmd>Lspsaga smart_scroll_with_saga(-1)<cr>',
				{ silent = true, desc = 'lspsaga | Scroll hover doc back' }
			),

			vim.keymap.set(
				'n',
				'<leader>lt',
				'<cmd>Lspsaga toggle_virtual_text<cr>',
				{ silent = true, desc = 'lspsaga | Toggle virtual text' }
			),

			vim.keymap.set(
				'n',
				'<C-k',
				'<cmd>Lspsaga signature_help<cr>',
				{ silent = true, desc = 'lspsaga | Signature help' }
			),

			vim.keymap.set(
				'n',
				'gh',
				'<cmd>Lspsaga lsp_finder<cr>',
				{ silent = true, desc = 'lspsaga | Definition and references' }
			),

			vim.keymap.set(
				{ 'n', 'v' },
				'<leader>ca',
				'<cmd>Lspsaga code_action<cr>',
				{ silent = true, desc = 'lspsaga | Code action' }
			),

			vim.keymap.set('n', 'gr', '<cmd>Lspsaga rename<cr>', { silent = true, desc = 'lspsaga | Rename' }),

			vim.keymap.set(
				'n',
				'gd',
				'<cmd>Lspsaga peek_definition<cr>',
				{ silent = true, desc = 'lspsaga | Peek definition' }
			),

			vim.keymap.set(
				'n',
				'<leader>cd',
				'<cmd>Lspsaga show_line_diagnostics<cr>',
				{ silent = true, desc = 'lspsaga | Show line diagnostics' }
			),

			vim.keymap.set(
				'n',
				'<leader>cd',
				'<cmd>Lspsaga show_cursor_diagnostics<cr>',
				{ silent = true, desc = 'lspsaga | Show cursor diagnostics' }
			),

			vim.keymap.set(
				'n',
				'[e',
				'<cmd>Lspsaga diagnostic_jump_prev<cr>',
				{ silent = true, desc = 'lspsaga | Diagnostics jump previous' }
			),

			vim.keymap.set(
				'n',
				']e',
				'<cmd>Lspsaga diagnostic_jump_next<cr>',
				{ silent = true, desc = 'lspsaga | Diagnostics jump next' }
			),

			vim.keymap.set('n', '[E', function()
				require('lspsaga.diagnostic').goto_prev({ severity = vim.diagnostic.severity.ERROR })
			end, { silent = true, desc = 'lspsaga | Diagnostics go to previous error' }),

			vim.keymap.set('n', ']E', function()
				require('lspsaga.diagnostic').goto_next({ severity = vim.diagnostic.severity.ERROR })
			end, { silent = true, desc = 'lspsaga | Diagnostics go to next error' }),

			vim.keymap.set(
				'n',
				'<leader>o',
				'<cmd>LSoutlineToggle<cr>',
				{ silent = true, desc = 'lspsaga | Toggle outline' }
			),

			vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', { silent = true, desc = 'lspsaga | Hover documentation' }),

			vim.keymap.set(
				'n',
				'<leader>ly',
				'<cmd>Lspsaga yank_line_diagnostics<cr>',
				{ silent = true, desc = 'lspsaga | Yank line diagnostics' }
			),

			vim.keymap.set(
				'n',
				'<A-d>',
				'<cmd>Lspsaga open_floaterm<cr>',
				{ silent = true, desc = 'lspsaga | Open floaterm' }
			),

			vim.keymap.set(
				'n',
				'<A-d>',
				'<cmd>Lspsaga open_floaterm lazygit<cr>',
				{ silent = true, desc = 'lspsaga | Open floaterm LazyGit' }
			),

			vim.keymap.set(
				't',
				'<A-d>',
				[[<C-\><C-n><cmd>Lspsaga close_floaterm<cr>]],
				{ silent = true, desc = 'lspsaga | Close floaterm' }
			),

			----------

			-- Options with default value
			-- "single" | "double" | "rounded" | "bold" | "plus"
			border_style = 'single',
			--the range of 0 for fully opaque window (disabled) to 100 for fully
			--transparent background. Values between 0-30 are typically most useful.
			saga_winblend = 0,
			-- when cursor in saga window you config these to move
			move_in_saga = { prev = '<C-p>', next = '<C-n>' },
			-- Error, Warn, Info, Hint
			-- use emoji like
			-- { "🙀", "😿", "😾", "😺" }
			-- or
			-- { "😡", "😥", "😤", "😐" }
			-- and diagnostic_header can be a function type
			-- must return a string and when diagnostic_header
			-- is function type it will have a param `entry`
			-- entry is a table type has these filed
			-- { bufnr, code, col, end_col, end_lnum, lnum, message, severity, source }
			diagnostic_header = { ' ', ' ', ' ', 'ﴞ ' },
			-- preview lines above of lsp_finder
			preview_lines_above = 0,
			-- preview lines of lsp_finder and definition preview
			max_preview_lines = 10,
			-- use emoji lightbulb in default
			code_action_icon = '💡',
			-- if true can press number to execute the codeaction in codeaction window
			code_action_num_shortcut = true,
			-- same as nvim-lightbulb but async
			code_action_lightbulb = {
				enable = true,
				enable_in_insert = true,
				cache_code_action = true,
				sign = true,
				icon = ' ',
				update_time = 150,
				sign_priority = 20,
				virtual_text = true,
			},
			-- finder icons
			finder_icons = {
				def = '  ',
				ref = '諭 ',
				link = '  ',
			},
			-- finder do lsp request timeout
			-- if your project big enough or your server very slow
			-- you may need to increase this value
			finder_request_timeout = 1500,
			finder_action_keys = {
				open = { 'o', '<CR>' },
				vsplit = 's',
				split = 'i',
				tabe = 't',
				quit = { 'q', '<ESC>' },
			},
			code_action_keys = {
				quit = 'q',
				exec = '<CR>',
			},
			definition_action_keys = {
				edit = '<C-c>o',
				vsplit = '<C-c>v',
				split = '<C-c>i',
				tabe = '<C-c>t',
				quit = 'q',
			},
			rename_action_quit = '<C-c>',
			rename_in_select = true,
			-- show symbols in winbar must nightly
			-- in_custom mean use lspsaga api to get symbols
			-- and set it to your custom winbar or some winbar plugins.
			-- if in_cusomt = true you must set in_enable to false
			symbol_in_winbar = {
				in_custom = false,
				enable = true,
				separator = ' ',
				show_file = true,
				-- define how to customize filename, eg: %:., %
				-- if not set, use default value `%:t`
				-- more information see `vim.fn.expand` or `expand`
				-- ## only valid after set `show_file = true`
				file_formatter = '',
				click_support = false,
			},
			-- show outline
			show_outline = {
				win_position = 'right',
				--set special filetype win that outline window split.like NvimTree neotree
				-- defx, db_ui
				win_with = '',
				win_width = 30,
				auto_enter = true,
				auto_preview = true,
				virt_text = '┃',
				jump_key = 'o',
				-- auto refresh when change buffer
				auto_refresh = true,
			},
			-- custom lsp kind
			-- usage { Field = 'color code'} or {Field = {your icon, your color code}}
			custom_kind = {},
			-- if you don't use nvim-lspconfig you must pass your server name and
			-- the related filetypes into this table
			-- like server_filetype_map = { metals = { "sbt", "scala" } }
			server_filetype_map = {},

			------------------------

			-- debug = false,
			-- -- diagnostic sign
			-- error_sign = "",
			-- warn_sign = "",
			-- hint_sign = "",
			-- infor_sign = "",
			-- diagnostic_header_icon = "   ",
			-- -- code action title icon
			-- code_action_icon = " ",
			-- code_action_prompt = {
			-- 	enable = true,
			-- 	sign = true,
			-- 	sign_priority = 40,
			-- 	virtual_text = true,
			-- },
			-- finder_definition_icon = "  ",
			-- finder_reference_icon = "  ",
			-- max_preview_lines = 10,
			-- finder_action_keys = {
			-- 	open = "o",
			-- 	vsplit = "s",
			-- 	split = "i",
			-- 	quit = "q",
			-- 	scroll_down = "<C-f>",
			-- 	scroll_up = "<C-b>",
			-- },
			-- code_action_keys = {
			-- 	quit = "q",
			-- 	exec = "<CR>",
			-- },
			-- rename_action_keys = {
			-- 	quit = "<C-c>",
			-- 	exec = "<CR>",
			-- },
			-- definition_preview_icon = "  ",
			-- border_style = "single",
			-- rename_prompt_prefix = "➤",
			-- rename_output_qflist = {
			-- 	enable = false,
			-- 	auto_open_qflist = false,
			-- },
			-- server_filetype_map = {},
			-- diagnostic_prefix_format = "%d. ",
			-- diagnostic_message_format = "%m %c %s",
			-- highlight_prefix = false,
		})
	end,
})
