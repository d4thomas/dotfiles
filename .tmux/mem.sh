# Move to ./plugins/tmux/custom/mem.sh
# Requires https://github.com/samoshkin/tmux-plugin-sysstat

show_mem() {
	local index icon color text module

	index=$1
	icon="$(get_tmux_option "@catppuccin_mem_icon" "󰍛")"
	color="$(get_tmux_option "@catppuccin_mem_color" "$thm_orange")"
	text="$(get_tmux_option "@catppuccin_mem_text" "#{sysstat_mem}")"

	module=$(build_status_module "$index" "$icon" "$color" "$text")

	echo "$module"
}
