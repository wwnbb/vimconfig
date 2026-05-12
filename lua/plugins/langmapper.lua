return {

	"Wansmer/langmapper.nvim",
	lazy = false,
	priority = 1,
	config = function()
		-- langmap only needs letter→letter pairs.
		-- Cyrillic letters that land on SYMBOLS in Programmer Dvorak are skipped:
		--   й→'  ц→,  у→.  х→/  ъ→@  э→-  я→;
		-- None of those are used for Vim motions, so nothing is lost.

		-- 25 Cyrillic letters that map to actual letters in Programmer Dvorak:
		local ru = "кенгшщзфывапролджчсмитьбю" -- 25
		local dv = "pyfgcrlaoeuидhtnsjkxbmwv"

		-- Wait — let's spell it out cleanly as explicit pairs to be 100% sure:
		-- к=p  е=y  н=f  г=g  ш=c  щ=r  з=l
		-- ф=a  ы=o  в=e  а=u  п=i  р=d  о=h  л=t  д=n  ж=s
		-- ч=q  с=j  м=k  и=x  т=b  ь=m  б=w  ю=v

		local map_pairs = {
			{ "к", "p" },
			{ "е", "y" },
			{ "н", "f" },
			{ "г", "g" },
			{ "ш", "c" },
			{ "щ", "r" },
			{ "з", "l" },
			{ "ф", "a" },
			{ "ы", "o" },
			{ "в", "e" },
			{ "а", "u" },
			{ "п", "i" },
			{ "р", "d" },
			{ "о", "h" },
			{ "л", "t" },
			{ "д", "n" },
			{ "ж", "s" },
			{ "ч", "q" },
			{ "с", "j" },
			{ "м", "k" },
			{ "и", "x" },
			{ "т", "b" },
			{ "ь", "m" },
			{ "б", "w" },
			{ "ю", "v" },
		}

		local langmap_entries = {}
		for _, pair in ipairs(map_pairs) do
			local cyr, lat = pair[1], pair[2]
			table.insert(langmap_entries, vim.fn.toupper(cyr) .. vim.fn.toupper(lat))
			table.insert(langmap_entries, cyr .. lat)
		end

		vim.opt.langmap = table.concat(langmap_entries, ",")

		require("langmapper").setup({
			hack_keymap = true,
			disable_hack_modes = { "i" },
			map_all_ctrl = true,
			ctrl_map_modes = { "n", "o", "i", "c", "t", "v" },
			automapping_modes = { "n", "v", "x", "s" },

			default_layout = '~"<>PYFGCRL?&|AOEUIDHTNS_:QJKXBMWVZ' .. "`',.pyfgcrl/@aoeuidhtns-;qjkxbmwvz",

			layouts = {
				ru = {
					id = "ru", -- confirm with `xkb-switch` while Russian is active
					layout = "ЁЙЦУКЕНГШЩЗХЪ/ФЫВАПРОЛДЖЭЯЧСМИТЬБЮ,"
						.. "ёйцукенгшщзхъфывапролджэячсмитьбю.",
				},
			},

			os = {
				Linux = {
					get_current_layout_id = function()
						local cmd = "xkb-switch"
						if vim.fn.executable(cmd) ~= 0 then
							local out = vim.split(vim.trim(vim.fn.system(cmd)), "\n")
							return out[#out]
						end
					end,
				},
			},
		})
	end,
}
