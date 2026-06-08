function __prompt_pwd
    set -l home_re (string escape --style=regex -- $HOME)
    string replace -r "^$home_re" "~" -- "$PWD"
end
