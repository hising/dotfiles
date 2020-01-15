# Created by newuser for 5.7.
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES
zstyle ':completion::complete:*' gain-privileges 1

setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

source ~/.zplug/init.zsh

zplug "zplug/zplug", hook-build:"zplug --self-manage"

zplug "plugins/git", from:oh-my-zsh
#zplug "miekg/lean"
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme
zplug "plugins/history-substring-search", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "arunvelsriram/kube-fzf", use:'kube-fzf.sh'
zplug "thecasualcoder/kube-fzf", as:command, use:"{*pod,*.sh}"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load


export DIRENV_LOG_FORMAT=
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

export HISTFILE=~/.zsh_history
export HISTSIZE=20000
export SAVEHIST=20000
export LPASS_AGENT_TIMEOUT=900
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

typeset -A ZSH_HIGHLIGHT_STYLES
export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
export ZSH_HIGHLIGHT_STYLES[alias]='fg=31'
export ZSH_HIGHLIGHT_STYLES[builtin]='fg=71'
export ZSH_HIGHLIGHT_STYLES[command]='fg=35'
export ZSH_HIGHLIGHT_STYLES[function]='fg=35'
export ZSH_HIGHLIGHT_STYLES[path]='fg=31'

## vim
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
e ()
{
  tmux select-window -t1 
  nvr --remote $(readlink -f "$@")
}

# Misc Apps
export ENABLE_FLUTTER_DESKTOP=true
export ANDROID_HOME=/home/hising/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/bin

# Go
export GOPATH=$HOME/go

[ -f /usr/share/bash-completion/completions/aws ] && source /usr/share/bash-completion/completions/aws
[ -f /opt/google-cloud-sdk/completion.zsh.inc ] && source /opt/google-cloud-sdk/completion.zsh.inc

# Aliases
alias vim=nvim
alias ls='ls --color=auto'
alias dotgit='git --work-tree $HOME --git-dir $HOME/.dot_git'

man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}
bindkey -e
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
bindkey -M emacs '^P' history-beginning-search-backward
bindkey -M emacs '^N' history-beginning-search-forward

source /usr/share/nvm/init-nvm.sh

nvm use 13.3.0

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
