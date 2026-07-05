# Selene — fzf/zoxide integration
# fzf wants #RRGGBB values. The selene_* palette variables intentionally
# omit the leading # because fish set_color uses bare RGB values.

set -gx FZF_DEFAULT_OPTS (string join ' ' -- \
  "--color=fg:#$selene_fg,bg:#$selene_bg,hl:#$selene_bright_white" \
  "--color=fg+:#$selene_bright_white,bg+:#$selene_accent_soft,hl+:#$selene_accent_hi" \
  "--color=info:#$selene_muted,prompt:#$selene_accent_hi,pointer:#$selene_accent_hi" \
  "--color=marker:#$selene_bright_white,spinner:#$selene_cyan,header:#$selene_bright_blue" \
  "--color=border:#$selene_line,gutter:#$selene_bg" \
)

if status is-interactive; and command -q zoxide
  zoxide init --cmd cd fish | source
end

if status is-interactive; and command -q fzf
  fzf --fish | source
end
