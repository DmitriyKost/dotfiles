# Commands and strings are semantic green; invalid commands/errors are red; args stay silver.
set -g fish_color_normal $selene_fg
set -g fish_color_command $selene_green
set -g fish_color_keyword $selene_bright_white
set -g fish_color_quote $selene_green
set -g fish_color_redirection $selene_bright_blue
set -g fish_color_end $selene_muted
set -g fish_color_error $selene_red
set -g fish_color_param $selene_fg
set -g fish_color_option $selene_fg
set -g fish_color_comment $selene_muted
set -g fish_color_operator $selene_muted
set -g fish_color_escape $selene_bright_magenta
set -g fish_color_autosuggestion $selene_muted
set -g fish_color_cancel $selene_red
set -g fish_color_cwd $selene_fg
set -g fish_color_cwd_root $selene_red
set -g fish_color_user $selene_fg
set -g fish_color_host $selene_muted
set -g fish_color_host_remote $selene_bright_red
set -g fish_color_status $selene_red
set -g fish_color_valid_path $selene_fg
set -g fish_color_match $selene_bright_white
set -g fish_color_selection $selene_selection_fg "--background=$selene_selection"
set -g fish_color_search_match $selene_bg "--background=$selene_accent_hi"
set -g fish_color_history_current $selene_selection_fg "--background=$selene_accent_soft"

set -g fish_pager_color_progress $selene_muted
set -g fish_pager_color_prefix $selene_accent_hi
set -g fish_pager_color_completion $selene_fg
set -g fish_pager_color_description $selene_muted
set -g fish_pager_color_selected_background "--background=$selene_selection"
set -g fish_pager_color_selected_completion $selene_bright_white
set -g fish_pager_color_selected_prefix $selene_bright_white
set -g fish_pager_color_selected_description $selene_bright_blue
set -g fish_pager_color_secondary_background "--background=$selene_black"
set -g fish_pager_color_secondary_completion $selene_fg
set -g fish_pager_color_secondary_prefix $selene_accent_hi
set -g fish_pager_color_secondary_description $selene_muted
