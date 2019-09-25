# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/usr/bin/:$PATH
export XCODE_DEVELOPER_DIR_PATH=/Applications/Xcode.app/Contents/Developer


# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="avit"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh


export RBENV_ROOT=$HOME/local/rbenv
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH=$RBENV_ROOT/bin:$HOME/local/bin:$PATH
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$GOPATH/bin:$PATH
export GOPATH=$HOME/go

eval "$(rbenv init -)"

function peco-ghq-cd () {
    local selected_dir=$(ghq list | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        selected_dir="`ghq root`/$selected_dir"
        BUFFER="cd ${selected_dir}"
    fi
    zle clear-screen
}
zle -N peco-ghq-cd
bindkey '^f' peco-ghq-cd

alias cdpj=$HOME/Documents/Project
alias cdgo='cd $GOPATH/src/github.com/kzumu'
alias be='bundle exec'
alias gcm='git commit'
alias gd='git diff'
alias gds='git diff --staged'
alias gch='git checkout'
alias gpu='git pull'
alias gs='git status'
alias gcam='git commit -a -m'
alias today='date +%Y%m%d'
export TOP_PAGE_URL="http://localhost:8080"
export PORT=3000

# GitRPG
GITRPG=$HOME/.GitRPG-master/gitrpg_client.py
function hoge(){
  COMMAND=${1}
  C_PORT=`lsof -t -i:3456`
  if [ "$C_PORT" = "" ]; then
    # 起動してない
    # echo "起動してない"
  else
    ${GITRPG} ${COMMAND}
    code=$?
    if [ $code -gt 0 ]; then;
      kill -INT 0
    fi
  fi
}
autoload -Uz add-zsh-hook
add-zsh-hook preexec hoge
export PATH=$HOME/.GitRPG-master:$PATH

if which swiftenv > /dev/null; then eval "$(swiftenv init -)"; fi

function git(){hub "$@"}

export PATH=/Users/kaz/go/src/github.com/flutter/flutter/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=/Users/kaz/Library/Developer/Xamarin/android-sdk-macosx/platform-tools:$PATH

function openxc() {
    if [ -e *.xcworkspace ]; then
        open *.xcworkspace
    elif [ -e *.xcodeproj ]; then
        open *.xcodeproj
    else
        echo "xcode file does not exist."
    fi
}

# chruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

# Zsh history https://github.com/b4b4r07/zsh-history
# DB file path
export ZSH_HISTORY_FILE="$HOME/.zsh_history.db"
# CLI selector
export ZSH_HISTORY_FILTER="fzy:fzf:peco:percol"
# History per directory
export ZSH_HISTORY_KEYBIND_GET_BY_DIR="^r"
# All histories
export ZSH_HISTORY_KEYBIND_GET_ALL="^r^a"
# Run any SQLs on original selector I/F (with screen)
export ZSH_HISTORY_KEYBIND_SCREEN="^r^r"
# substring
export ZSH_HISTORY_KEYBIND_ARROW_UP="^p"
export ZSH_HISTORY_KEYBIND_ARROW_DOWN="^n"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zsh-autosuggestions https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

##################################################################################
# Show stash count  https://qiita.com/Cside/items/13f85c11d3d0aa35d7ef
# function git_prompt_stash_count {
#   local COUNT=$(git stash list 2>/dev/null | wc -l | tr -d ' ')
#   if [ "$COUNT" -gt 0 ]; then
#     echo " ($COUNT)"
#   fi
# }
# 
# setopt prompt_subst
# autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null
# 
# function rprompt-git-current-branch {
#   local name st color action
# 
#   if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
#     return
#   fi
# 
#   name=$(basename "`git symbolic-ref HEAD 2> /dev/null`")
#   if [[ -z $name ]]; then
#     return
#   fi
# 
#   st=`git status 2> /dev/null`
#   if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
#     color=${fg[blue]}
#   elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
#     color=${fg[yellow]}
#   elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
#     color=${fg_bold[red]}
#   else
#     color=${fg[red]}
#   fi
# 
#   gitdir=`git rev-parse --git-dir 2> /dev/null`
#   action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"
# 
#   # %{...%} surrounds escape string
#   echo "%{$color%}$name$action`git_prompt_stash_count`$color%{$reset_color%}"
# }
# 
# # how to use
# PROMPT='`rprompt-git-current-branch`'
# 
##################################################################################

# https://github.com/starship/starship
eval "$(starship init zsh)"
