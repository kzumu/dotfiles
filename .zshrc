# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/usr/bin/:$PATH


# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="avit"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

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

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

export RBENV_ROOT=$HOME/local/rbenv
export PATH=$RBENV_ROOT/bin:$HOME/local/bin:$PATH
eval "$(rbenv init -)"
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=$PATH:/usr/local/go/bin

export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

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
alias gcm='git commit -m'
alias gd='git diff'
alias gds='git diff --staged'
alias gc='git checkout'
alias gpu='git pull'
alias gs='git status'
alias gcam='git commit -a -m'
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
