export LC_ALL=en_US.UTF-8
export XCODE_DEVELOPER_DIR_PATH=/Applications/Xcode.app/Contents/Developer
export RBENV_ROOT=$HOME/local/rbenv
export GOPATH=$HOME/go
export TOP_PAGE_URL="http://localhost:8080"
export PORT=3000

# CyberAgent
export PATH=/Users/s06100/Library/Developer/Flutter/bin:$PATH

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

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export ANDROID_HOME="/Users/kaz/Library/Developer/AndroidStudio"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-completions)
autoload -U compinit && compinit
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
ZSH_THEME="avit"

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/usr/bin/:$PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$RBENV_ROOT/bin:$HOME/local/bin:$PATH
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=/usr/local/go/bin/:$PATH
export PATH=$GOPATH/bin:$PATH
export PATH=/Users/kaz/go/src/github.com/flutter/flutter/bin:$PATH
export PATH=/Users/kaz/Library/Developer/Xamarin/android-sdk-macosx/platform-tools:$PATH
export PATH=/Users/kaz/Library/Developer/AndroidStudio/platform-tools:$PATH

# zplug
source ~/.zplug/init.zsh
zplug="zsh-users/zsh-autosuggestions"
zplug "b4b4r07/emoji-cli", as:plugin
zplug "b4b4r07/enhancd", use:init.sh, as:plugin
ENHANCD_USE_FUZZY_MATCH=0

zplug load --verbose

source $ZSH/oh-my-zsh.sh
# chruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

### Register Widget ###
function _peco-ghq-cd () {
    local selected_dir=$(ghq list | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        selected_dir="`ghq root`/$selected_dir"
        BUFFER="cd ${selected_dir}"
    fi
    zle clear-screen
}
zle -N _peco-ghq-cd

function _git-pull-origin-master () {
  echo git pull origin master
  git pull origin master
  zle accept-line
}
zle -N _git-pull-origin-master

function _fzf () { fzf }
zle -N _fzf
### Register Widget ###

# bindkey -v
# bindkey '^l' _fzf
bindkey '^F' _peco-ghq-cd
bindkey '^G^P^M' _git-pull-origin-master

alias cdpj=$HOME/Documents/Project
alias cdgo='cd $GOPATH/src/github.com/kzumu'
alias be='bundle exec'
alias gcm='git commit'
alias gd='git diff'
alias gds='git diff --staged'
alias gch='git checkout'
alias gpul='git pull'
alias gpus='git push'
alias gs='git status'
alias gcam='git commit -a -m'
alias today='date +%Y%m%d'
alias yesterday='date -v-1d +%Y%m%d'
alias g='git'
alias ga='g add'
alias recentfile='ls -t | head -1'
alias fvi='vi $(fzf)'

# My awesome custom commands
alias s='~/go/src/github.com/s2mr/Scripts/.build/debug/Scripts'
alias scripts=s
alias xc='s xc'

eval "$(hub alias -s zsh)"

if which swiftenv > /dev/null; then eval "$(swiftenv init -)"; fi

# https://github.com/starship/starship
eval "$(starship init zsh)"
eval "$(rbenv init -)"

if [ -f '/Users/kaz/.google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kaz/.google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/kaz/.google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kaz/.google-cloud-sdk/completion.zsh.inc'; fi

if [ -e /usr/local/share/zsh-completions ]; then
      fpath=(/usr/local/share/zsh-completions $fpath)
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
