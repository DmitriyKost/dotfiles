set -gx GOPATH "$HOME/go"
set -gx GO111MODULE on
set -gx MANPAGER 'nvim +Man!'

fish_add_path -g /usr/bin /bin /usr/sbin /sbin

if test -d /opt/homebrew/bin
    fish_add_path -g /opt/homebrew/bin /opt/homebrew/sbin
else if test -d /usr/local/bin
    fish_add_path -g /usr/local/bin /usr/local/sbin
end
fish_add_path -g "$HOME/.local/bin"
fish_add_path -g "$HOME/.cargo/bin"
fish_add_path -g "$HOME/.opencode/bin"
fish_add_path -g "$GOPATH/bin"

if test -n "$GOROOT"
    fish_add_path -g "$GOROOT/bin"
end
