function fish_prompt
  set -l last_status $status

  if contains -- --final-rendering $argv
    if test $last_status -eq 0
        set_color $selene_prompt_final
        echo -n '› '
    else
        set_color $selene_prompt_fail
        echo -n '✗ '
    end

    set_color normal
    return
 end

 if set -q SSH_TTY
  set -l host (hostname -s 2>/dev/null)
  if test -z "$host"
   set host (hostname)
  end
  set_color $selene_muted
  echo -n "$host "
 end

 set_color $selene_fg
 echo -n (__prompt_pwd)
 set_color normal

 if test "$last_status" -ne 0
  echo -n ' '
  set_color $selene_red
  echo -n "exit $last_status"
  set_color normal
 end

 if set -q CMD_DURATION; and test "$CMD_DURATION" -ge 1000
  set -l elapsed (math --scale=2 "$CMD_DURATION / 1000")
  echo -n ' '
  set_color $selene_muted
  echo -n "$elapsed"s
  set_color normal
 end

 set -l git_info (__prompt_git)
 if test -n "$git_info"
  echo -n ' '
  echo -n "$git_info"
 end

 echo -n ' '
 set_color $selene_accent_hi
 echo -n ':: '
 set_color normal
end
