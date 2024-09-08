local line_ok, feline = pcall(require, "feline")
if not line_ok then
	return
end

-- Updated Rose Pine Dawn color palette (matching barbar)
local rose_pine_dawn = {
	fg = "#575279",       -- Text color
	bg = "#ebe5df",       -- Background color
	green = "#44BD60",    -- Greenish color
	yellow = "#f6c177",   -- Yellowish color
	purple = "#c4a7e7",   -- Purple color
	orange = "#f5a97f",   -- Orange color
	peanut = "#f5c2e7",   -- Peanut color
	red = "#eb6f92",      -- Red color
	aqua = "#9ccfd8",     -- Aqua color
	darkblue = "#1f1f28", -- Dark blue color
	dark_red = "#eb6f92", -- Dark red color
	inactive_bg = "#f2ede9", -- Inactive background
	inactive_fg = "#797593", -- Inactive foreground
	active_fg = "#575279", -- Active foreground
	fill_bg = "#faf4ed"   -- Fill background
}

local vi_mode_colors = {
	NORMAL = "green",
	OP = "green",
	INSERT = "yellow",
	VISUAL = "purple",
	LINES = "orange",
	BLOCK = "dark_red",
	REPLACE = "red",
	COMMAND = "aqua",
}

local c = {
	vim_mode = {
		provider = {
			name = "vi_mode",
			opts = {
				show_mode_name = true,
			},
		},
		hl = function()
			return {
				fg = require("feline.providers.vi_mode").get_mode_color(),
				bg = rose_pine_dawn.bg,
				style = "bold",
				name = "NeovimModeHLColor",
			}
		end,
		left_sep = "block",
		right_sep = "block",
	},
	gitBranch = {
		provider = "git_branch",
		hl = {
			fg = rose_pine_dawn.purple,
			bg = rose_pine_dawn.bg,
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	gitDiffAdded = {
		provider = "git_diff_added",
		hl = {
			fg = rose_pine_dawn.green,
			bg = rose_pine_dawn.bg,
		},
		icon = "+",
		left_sep = "block",
		right_sep = "block",
	},
	gitDiffChanged = {
		provider = "git_diff_changed",
		hl = {
			fg = rose_pine_dawn.yellow,
			bg = rose_pine_dawn.bg,
		},
		icon = '±',
		left_sep = "block",
		right_sep = "right_filled",
	},
	gitDiffRemoved = {
		provider = "git_diff_removed",
		hl = {
			fg = rose_pine_dawn.red,
			bg = rose_pine_dawn.bg,
		},
		icon = "-",
		left_sep = "block",
		right_sep = "right_filled",
	},
	separator = {
		provider = "",
	},
	fileinfo = {
		provider = {
			name = "file_info",
			opts = {
				type = "full_path",
			},
		},
		hl = {
			fg = rose_pine_dawn.fg,
			style = "bold",
		},
		left_sep = " ",
		right_sep = " ",
	},
	diagnostic_errors = {
		provider = "diagnostic_errors",
		hl = {
			fg = rose_pine_dawn.red,
			bg = rose_pine_dawn.bg,
		},
	},
	diagnostic_warnings = {
		provider = "diagnostic_warnings",
		hl = {
			fg = rose_pine_dawn.yellow,
			bg = rose_pine_dawn.bg,
		},
	},
	diagnostic_hints = {
		provider = "diagnostic_hints",
		hl = {
			fg = rose_pine_dawn.aqua,
			bg = rose_pine_dawn.bg,
		},
	},
	diagnostic_info = {
		provider = "diagnostic_info",
		hl = {
			fg = rose_pine_dawn.green,
			bg = rose_pine_dawn.bg,
		},
	},
	lsp_client_names = {
		provider = "lsp_client_names",
		hl = {
			fg = rose_pine_dawn.purple,
			bg = rose_pine_dawn.bg,
			style = "bold",
		},
		left_sep = "left_filled",
		right_sep = "block",
	},
	file_type = {
		provider = {
			name = "file_type",
			opts = {
				filetype_icon = true,
				case = "titlecase",
			},
		},
		hl = {
			fg = rose_pine_dawn.orange,
			bg = rose_pine_dawn.bg,
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	file_encoding = {
		provider = "file_encoding",
		hl = {
			fg = rose_pine_dawn.fg,
			bg = rose_pine_dawn.bg,
			style = "italic",
		},
		left_sep = "block",
		right_sep = "block",
	},
	position = {
		provider = "position",
		hl = {
			fg = rose_pine_dawn.green,
			bg = rose_pine_dawn.bg,
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	line_percentage = {
		provider = "line_percentage",
		hl = {
			fg = rose_pine_dawn.aqua,
			bg = rose_pine_dawn.bg,
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	scroll_bar = {
		provider = "scroll_bar",
		hl = {
			fg = rose_pine_dawn.yellow,
			bg = rose_pine_dawn.bg,
			style = "bold",
		},
	},
}

local left = {
	c.vim_mode,
	c.gitBranch,
	c.gitDiffAdded,
	c.gitDiffRemoved,
	c.gitDiffChanged,
	c.separator,
}

local middle = {
	c.fileinfo,
	c.diagnostic_errors,
	c.diagnostic_warnings,
	c.diagnostic_info,
	c.diagnostic_hints,
}

local right = {
	c.lsp_client_names,
	c.file_type,
	c.file_encoding,
	c.position,
	c.line_percentage,
	c.scroll_bar,
}

local components = {
	active = {
		left,
		middle,
		right,
	},
	inactive = {
		left,
		middle,
		right,
	},
}

feline.setup({
	components = components,
	theme = rose_pine_dawn,
	vi_mode_colors = vi_mode_colors,
})
