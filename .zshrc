# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$PATH:$HOME/.config/composer/vendor/bin";
export PATH="$PATH:$HOME/development/flutter/bin/flutter";
# Path to your oh-my-zsh installation.

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

source ~/.zplug/init.zsh

zplug "zsh-users/zsh-history-substring-search"
zplug "plugins/history-substring-search", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "plugins/git",   from:oh-my-zsh
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

## vim
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
e ()
{
  tmux select-window -t1 
  nvr --remote $(readlink -f "$@")
}

test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)

# Misc Apps
export ENABLE_FLUTTER_DESKTOP=true
export PATH=$PATH:/home/hising/Tools/flutter/bin
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
alias ls=exa
alias xc='xclip -selection clipboard'
alias dotgit='git --work-tree $HOME --git-dir $HOME/.dot_git'

alias dev="cd ~/src/github.com"
alias personal="cd ~/src/github.com/hising"
alias yetric="cd ~/src/github.com/yetric"

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


export HISTFILE=~/.zsh_history
export HISTSIZE=20000
export SAVEHIST=20000
export LPASS_AGENT_TIMEOUT=900
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

## vim
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket

setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
# setopt append_history
setopt share_history

## nvm

[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"
