function fish_mode_prompt
	set -l label
	set -l color

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
