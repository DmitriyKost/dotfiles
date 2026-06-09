set -gx GOPATH "$HOME/go"
set -gx GO111MODULE on
set -gx MANPAGER 'nvim +Man!'

fish_add_path -g "$HOME/.local/bin"
fish_add_path -g "$HOME/.cargo/bin"
fish_add_path -g "$HOME/.opencode/bin"
fish_add_path -g "$GOPATH/bin"

if test -n "$GOROOT"
    fish_add_path -g "$GOROOT/bin"
end
