# ~/.zshrc

# -----------------------------
# Zinit
# -----------------------------

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [[ ! -d "$ZINIT_HOME" ]]; then
    mkdir -p "$(dirname "$ZINIT_HOME")"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"


# -----------------------------
# History
# -----------------------------

HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh/history"
HISTSIZE=100000
SAVEHIST=100000

mkdir -p "${HISTFILE:h}"

setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY


# -----------------------------
# Basic shell behavior
# -----------------------------

setopt AUTO_CD
setopt INTERACTIVE_COMMENTS
setopt NO_BEEP
setopt PROMPT_SUBST

# No right prompt.
unsetopt TRANSIENT_RPROMPT
RPROMPT=''

autoload -Uz colors
colors


# -----------------------------
# Aliases
# -----------------------------

alias n='nvim'
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'


# -----------------------------
# PATH and environment
# -----------------------------

export GOPATH="$HOME/go"
export GO111MODULE=on


export MANPAGER='nvim +Man!'

typeset -U path

path=(
    "$HOME/.local/bin"
    "$HOME/Library/Python/3.9/bin"
    "/home/dkost/.opencode/bin"
    "$GOPATH/bin"
    $path
)

if [[ -n "$GOROOT" ]]; then
    path+=("$GOROOT/bin")
fi

export PATH


# -----------------------------
# fzf
# -----------------------------

export FZF_DEFAULT_OPTS="
--color=fg:#F5EFE7,bg:#141210,hl:#D88A5F
--color=fg+:#FFF7EE,bg+:#352D27,hl+:#FFD479
--color=info:#847568,prompt:#D88A5F,pointer:#B86A46
--color=marker:#B48EED,spinner:#68B8A8,header:#8EB8D9
--color=border:#6B5E53,gutter:#141210
"


# -----------------------------
# Completions
# -----------------------------

fpath=("$HOME/.zsh/completions" $fpath)

zinit light zsh-users/zsh-completions

autoload -Uz compinit

ZSH_COMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"
mkdir -p "${ZSH_COMPDUMP:h}"

compinit -d "$ZSH_COMPDUMP"

zmodload zsh/complist

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-dirs-first true
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' verbose true
zstyle ':completion:*:descriptions' format '%F{#D88A5F}%d%f'
zstyle ':completion:*:warnings' format '%F{#B86A46}no matches%f'


# -----------------------------
# Autosuggestions
# -----------------------------

zinit light zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#847568'


# -----------------------------
# zoxide
# -----------------------------

if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init --cmd cd zsh)"
fi


# -----------------------------
# Manual prompt
# -----------------------------

zmodload zsh/datetime
autoload -Uz add-zsh-hook

typeset -g __cmd_start=0
typeset -g __prompt_timer=''
typeset -g __prompt_exit=''
typeset -g __prompt_git=''

prompt_preexec() {
    __cmd_start=$EPOCHREALTIME
}

prompt_git() {
    git rev-parse --is-inside-work-tree >/dev/null 2>&1 || return

    local branch
    local dirty=''
    local staged=''
    local untracked=''

    branch=$(git symbolic-ref --quiet --short HEAD 2>/dev/null) || \
    branch=$(git rev-parse --short HEAD 2>/dev/null) || return

    # Escape percent signs so branch names don't break prompt expansion.
    branch="${branch//\%/%%}"

    git diff --quiet --ignore-submodules -- 2>/dev/null || dirty='*'
    git diff --cached --quiet --ignore-submodules -- 2>/dev/null || staged='+'

    if [[ -n "$(git ls-files --others --exclude-standard 2>/dev/null)" ]]; then
        untracked='?'
    fi

    print -r -- "%F{#B48EED} ${branch}${staged}${dirty}${untracked}%f"
}

prompt_build() {
    local -a parts

    # Change %~ to %1~ if you only want the current directory name.
    # Change %~ to %3~ if you want max 3 path components.
    parts=("%F{#F0B85F}%~%f")

    [[ -n "$__prompt_exit" ]] && parts+=("$__prompt_exit")
    [[ -n "$__prompt_timer" ]] && parts+=("$__prompt_timer")
    [[ -n "$__prompt_git" ]] && parts+=("$__prompt_git")

    PROMPT="${(j: :)parts} %F{#D88A5F}❯%f "
    RPROMPT=''
}

prompt_precmd() {
    local last_code=$?
    local elapsed

    __prompt_timer=''
    __prompt_exit=''
    __prompt_git=''

    if (( __cmd_start > 0 )); then
        elapsed=$(( EPOCHREALTIME - __cmd_start ))

        # Show timer for commands taking at least 0.1s.
        if (( elapsed >= 0.1 )); then
            __prompt_timer="%F{#847568}$(printf '%.2fs' "$elapsed")%f"
        fi

        __cmd_start=0
    fi

    if (( last_code != 0 )); then
        __prompt_exit="%F{#B86A46}exit ${last_code}%f"
    fi

    __prompt_git="$(prompt_git)"

    prompt_build
}

prompt_title() {
    print -Pn "\e]0;%~\a"
}

add-zsh-hook preexec prompt_preexec
add-zsh-hook precmd prompt_precmd
add-zsh-hook precmd prompt_title

prompt_build

# -----------------------------
# Syntax highlighting
# Keep this near the end.
# -----------------------------

zinit light zsh-users/zsh-syntax-highlighting
