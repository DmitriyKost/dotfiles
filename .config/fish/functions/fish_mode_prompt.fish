function fish_mode_prompt
	set -l label
	set -l color

	# For fish transient prompt: old prompts become a tiny dim marker.
	if contains -- --final-rendering $argv
		set_color 4A4A4A
		echo -n '· '
		set_color normal
		return
	end

	switch $fish_bind_mode
		case default
			set label '[N]'
			set color $selene_mode_normal

		case insert
			set label '[I]'
			set color $selene_mode_insert

		case visual
			set label '[V]'
			set color $selene_mode_visual

		case replace replace_one
			set label '[R]'
			set color $selene_mode_replace

		case '*'
			set label '[?]'
			set color $selene_mode_command
	end

	set_color $color
	echo -n "$label "
	set_color normal
end
