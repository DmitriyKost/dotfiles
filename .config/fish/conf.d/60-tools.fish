set -gx FZF_DEFAULT_OPTS (string join ' ' -- \
    "--color=fg:#$warm_fg,bg:#$warm_bg,hl:#$warm_orange" \
    "--color=fg+:#$warm_bright_white,bg+:#$warm_bright_black,hl+:#$warm_bright_yellow" \
    "--color=info:#$warm_brown,prompt:#$warm_orange,pointer:#$warm_brown" \
    "--color=marker:#$warm_bright_magenta,spinner:#$warm_cyan,header:#$warm_bright_blue" \
    "--color=border:#$warm_bright_black,gutter:#$warm_bg" \
)

if status is-interactive; and command -q zoxide
    zoxide init --cmd cd fish | source
end
