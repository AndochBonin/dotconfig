return {
	"milanglacier/minuet-ai.nvim",
	opts = {
		provider = "openai_fim_compatible",
		n_completions = 1,
		context_window = 2048,
		throttle = 500,
		debounce = 300,
		request_timeout = 3,
		provider_options = {
			openai_fim_compatible = {
				api_key = "TERM",
				name = "Ollama",
				end_point = "http://localhost:11434/v1/completions",
				model = "qwen2.5-coder:3b",
				optional = {
					max_tokens = 56,
					top_p = 0.9,
				},
			},
		},
		virtualtext = {
			auto_trigger_ft = { "*" },
			auto_trigger_ignore_ft = { "help", "lazy", "mason", "oil" },
			show_on_completion_menu = false,
			keymap = {
				accept = nil,
				accept_line = "<C-l>",
				accept_n_lines = "<A-z>",
				next = "<A-]>",
				prev = "<A-[>",
				dismiss = "<C-e>",
			},
		},
	},
	config = function(_, opts)
		require("minuet").setup(opts)

		local vt = require("minuet.virtualtext").action
		vim.keymap.set("i", "<Tab>", function()
			if vt.is_visible() then
				vt.accept()
			else
				return "<Tab>"
			end
		end, { expr = true, desc = "[minuet] accept or indent" })
	end,
}
