# Selene — silver-first OLED palette
# Hex values are stored without the leading # because fish set_color expects that form.

set -g selene_bg 000000
set -g selene_fg AFAFAF
set -g selene_selection 202020
set -g selene_selection_fg C8C8C8

set -g selene_black 000000
set -g selene_red B96572
set -g selene_green 7FA68D
set -g selene_yellow B38E5F
set -g selene_blue 8490A0
set -g selene_magenta 8D86AA
set -g selene_cyan 72A6A0
set -g selene_white AFAFAF

set -g selene_bright_black 1A1A1A
set -g selene_bright_red CC7D87
set -g selene_bright_green 94BCA1
set -g selene_bright_yellow C7A66E
set -g selene_bright_blue 9AA3AD
set -g selene_bright_magenta A49AC2
set -g selene_bright_cyan 86BCB5
set -g selene_bright_white C8C8C8

set -g selene_orange 9A735E
set -g selene_brown 6A4F4A

set -g selene_bg_alt 101010
set -g selene_accent 202020
set -g selene_accent_soft 2A2A2A
set -g selene_accent_hi B8B8B8
set -g selene_muted 686868
set -g selene_statusline_bg 050505
set -g selene_line 151515

set -g selene_mode_normal $selene_accent_hi
set -g selene_mode_insert $selene_cyan
set -g selene_mode_visual $selene_magenta
set -g selene_mode_replace $selene_red
set -g selene_mode_command $selene_yellow
set -g selene_mode_terminal $selene_blue

# Compatibility aliases for older config fragments that still reference warm_*.
# These can be removed after every warm_* reference is migrated.
set -g warm_bg $selene_bg
set -g warm_fg $selene_fg
set -g warm_selection $selene_selection
set -g warm_selection_fg $selene_selection_fg
set -g warm_black $selene_black
set -g warm_red $selene_red
set -g warm_green $selene_green
set -g warm_yellow $selene_yellow
set -g warm_blue $selene_blue
set -g warm_magenta $selene_magenta
set -g warm_cyan $selene_cyan
set -g warm_white $selene_white
set -g warm_bright_black $selene_bright_black
set -g warm_bright_red $selene_bright_red
set -g warm_bright_green $selene_bright_green
set -g warm_bright_yellow $selene_bright_yellow
set -g warm_bright_blue $selene_bright_blue
set -g warm_bright_magenta $selene_bright_magenta
set -g warm_bright_cyan $selene_bright_cyan
set -g warm_bright_white $selene_bright_white
set -g warm_orange $selene_orange
set -g warm_brown $selene_brown
set -g warm_muted $selene_muted
set -g warm_statusline_bg $selene_statusline_bg
set -g warm_line $selene_line
set -g warm_mode_normal $selene_mode_normal
set -g warm_mode_insert $selene_mode_insert
set -g warm_mode_visual $selene_mode_visual
set -g warm_mode_replace $selene_mode_replace
set -g warm_mode_command $selene_mode_command
set -g warm_mode_terminal $selene_mode_terminal
