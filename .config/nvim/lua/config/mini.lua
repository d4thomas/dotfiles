-- MiniIcons
require("mini.icons").setup()

-- MiniGit
require("mini.git").setup()

-- MiniDiff
require("mini.diff").setup()

-- MiniStatusline
local lsp_client_name = function()
	if #vim.lsp.get_clients() < 1 then
		return nil
	else
		if #vim.lsp.get_clients() > 1 then
			local lsp_name = vim.lsp.get_clients()[1].name
			for i = 2, #vim.lsp.get_clients() do
				lsp_name = lsp_name .. " - " .. vim.lsp.get_clients()[i].name
			end
			return "  " .. lsp_name
		end
		return "  " .. vim.lsp.get_clients()[1].name
	end
end

require("mini.statusline").setup({
	content = {
		active = function()
			local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
			local git = MiniStatusline.section_git({ trunc_width = 40 })
			local diff = MiniStatusline.section_diff({ trunc_width = 75 })
			local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
			local lsp = lsp_client_name()
			local filename = MiniStatusline.section_filename({ trunc_width = 140 })
			local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
			local location = MiniStatusline.section_location({ trunc_width = 75 })
			local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

			return MiniStatusline.combine_groups({
				{ hl = mode_hl, strings = { mode } },
				{ hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics, lsp } },
				"%<",
				{ hl = "MiniStatuslineFilename", strings = { filename } },
				"%=",
				{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
				{ hl = mode_hl, strings = { search, location } },
			})
		end,
	},
})

-- MiniBase16
require("mini.base16").setup({
	palette = {
		base00 = "#0f1419",
		base01 = "#131721",
		base02 = "#272d38",
		base03 = "#3e4b59",
		base04 = "#bfbdb6",
		base05 = "#e6e1cf",
		base06 = "#e6e1cf",
		base07 = "#f3f4f5",
		base08 = "#f07178",
		base09 = "#ff8f40",
		base0A = "#ffb454",
		base0B = "#b8cc52",
		base0C = "#95e6cb",
		base0D = "#59c2ff",
		base0E = "#d2a6ff",
		base0F = "#e6b673",
	},
})

-- MiniAi
require("mini.ai").setup()

-- MiniBracketed
require("mini.bracketed").setup()

-- MiniClue
local miniclue = require("mini.clue")
miniclue.setup({
	triggers = {
		-- Leader triggers
		{ mode = "n", keys = "<Leader>" },
		{ mode = "x", keys = "<Leader>" },

		-- Built-in completion
		{ mode = "i", keys = "<C-x>" },

		-- `g` key
		{ mode = "n", keys = "g" },
		{ mode = "x", keys = "g" },

		-- Marks
		{ mode = "n", keys = "'" },
		{ mode = "n", keys = "`" },
		{ mode = "x", keys = "'" },
		{ mode = "x", keys = "`" },

		-- Registers
		{ mode = "n", keys = '"' },
		{ mode = "x", keys = '"' },
		{ mode = "i", keys = "<C-r>" },
		{ mode = "c", keys = "<C-r>" },

		-- Window commands
		{ mode = "n", keys = "<C-w>" },

		-- `z` key
		{ mode = "n", keys = "z" },
		{ mode = "x", keys = "z" },

		-- Telescope
		{ mode = "n", keys = ";" },
	},

	clues = {
		miniclue.gen_clues.builtin_completion(),
		miniclue.gen_clues.g(),
		miniclue.gen_clues.marks(),
		miniclue.gen_clues.registers(),
		miniclue.gen_clues.windows(),
		miniclue.gen_clues.z(),
	},

	window = {
		delay = 100,
		config = {
			width = "auto",
			border = "single",
		},
	},
})

-- MiniCursorword
require("mini.cursorword").setup()

-- MiniFiles
require("mini.files").setup()

-- MiniFuzzy
require("mini.fuzzy").setup()

-- MiniHipaterns
local hipatterns = require("mini.hipatterns")
hipatterns.setup({
	highlighters = {
		-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
		fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
		hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
		todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
		note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

		-- Highlight hex color strings (`#rrggbb`) using that color
		hex_color = hipatterns.gen_highlighter.hex_color(),
	},
})

-- MiniIndentscope
require("mini.indentscope").setup()

-- MiniJump
require("mini.jump").setup({
	mappings = {
		forward = "f",
		backward = "F",
		forward_till = "t",
		backward_till = "T",
		repeat_jump = ".",
	},
})

-- MiniMap
require("mini.map").setup()

-- MiniMove
require("mini.move").setup()

-- MiniNotify
require("mini.notify").setup()

-- MiniPairs
require("mini.pairs").setup({
	modes = { insert = true, command = true, terminal = false },
})

-- MiniSessions
require("mini.sessions").setup()

-- MiniSplitjoin
require("mini.splitjoin").setup()

-- MiniStarter
require("mini.starter").setup({
	header = function()
		return vim.fn.strftime("%a %b %d %I:%M %p")
	end,
	footer = "iiixio",
})

-- MiniSurround
require("mini.surround").setup()

-- MiniTabline
require("mini.tabline").setup()

-- MiniComment
require("mini.comment").setup()

-- MiniTrailspce
require("mini.trailspace").setup()
