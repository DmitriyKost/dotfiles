function fish_mode_prompt
    set -l label
    set -l color

    switch $fish_bind_mode
        case default
            set label '[N]'
            set color $warm_mode_normal

        case insert
            set label '[I]'
            set color $warm_mode_insert

        case visual
            set label '[V]'
            set color $warm_mode_visual

        case replace replace_one
            set label '[R]'
            set color $warm_mode_replace

        case '*'
            set label '[?]'
            set color $warm_mode_command
    end

    set_color --bold $color
    echo -n "$label "
    set_color normal
end
