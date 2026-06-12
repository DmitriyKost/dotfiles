function fish_prompt
    set -l last_status $status

    set -l host (hostname -s 2>/dev/null)
    if test -z "$host"
        set host (hostname)
    end

    set_color $warm_muted
    echo -n "$host "
    set_color $warm_yellow
    echo -n (__prompt_pwd)
    set_color normal

    if test "$last_status" -ne 0
        echo -n ' '
        set_color $warm_brown
        echo -n "exit $last_status"
        set_color normal
    end

    if set -q CMD_DURATION; and test "$CMD_DURATION" -ge 100
        set -l elapsed (math --scale=2 "$CMD_DURATION / 1000")
        echo -n ' '
        set_color $warm_muted
        echo -n "$elapsed"s
        set_color normal
    end

    set -l git_info (__prompt_git)
    if test -n "$git_info"
        echo -n ' '
        echo -n "$git_info"
    end

    echo -n ' '
    set_color $warm_orange
    echo -n '❯ '
    set_color normal
end
