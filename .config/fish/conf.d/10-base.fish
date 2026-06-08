set -g fish_greeting

if status is-interactive
    set -g fish_key_bindings fish_vi_key_bindings

    set -g fish_cursor_default block blink
    set -g fish_cursor_insert line blink
    set -g fish_cursor_replace_one underscore blink
    set -g fish_cursor_replace underscore blink
    set -g fish_cursor_external line blink
    set -g fish_cursor_visual block blink
end
