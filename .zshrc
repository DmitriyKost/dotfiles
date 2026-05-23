# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

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

alias n='nvim'
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(zoxide init --cmd cd zsh)"

export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

export GO111MODULE=on

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#847568'
# Enable vi mode
# set -o vi
#
export PATH="$HOME/Library/Python/3.9/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export MANPAGER="nvim +Man!"
export FZF_DEFAULT_OPTS="
--color=fg:#F5EFE7,bg:#141210,hl:#D88A5F
--color=fg+:#FFF7EE,bg+:#352D27,hl+:#FFD479
--color=info:#847568,prompt:#D88A5F,pointer:#B86A46
--color=marker:#B48EED,spinner:#68B8A8,header:#8EB8D9
--color=border:#6B5E53,gutter:#141210
"
# opencode
export PATH=/home/dkost/.opencode/bin:$PATH
