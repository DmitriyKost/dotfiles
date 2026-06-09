# ~/.config/fish/config.fish
# Final user overrides. Most config lives in conf.d/.

set -l config_dir (status dirname)

if test -f $config_dir/local.fish
    source $config_dir/local.fish
end
