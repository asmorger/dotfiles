if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Environment
set fish_greeting
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"
export PATH="$HOME/.spicetify:$PATH"
export PATH="$HOME/.local/share/JetBrains/Toolbox/scripts:$PATH"
export PATH="$PATH:$HOME/.local/bin:$PATH"
export DOTNET_ROOT="$HOME/.dotnet"
export PATH="$PATH:$HOME/.dotnet:$HOME/.dotnet/tools"

export npm_config_prefix="$HOME/.local"
export EDITOR="/usr/bin/emacsclient -nc -a 'emacs'"

# Autocomplete

complete -f -c dotnet -a "(dotnet complete)"

# Aliases

alias vim='nvim'
alias emacs='emacsclient -nc -a "emacs"'
alias cat='bat'
alias tracert='mtr'
alias top='btm'
alias hx='helix'
alias mm='h-m-m'
alias cls='clear'
alias gg='lazygit'

## Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

## Personal Git aliases
alias gs='git status'
alias gaa='git add -A'
alias gb='git checkout -b'
alias gm='git checkout main && git pull'
alias gco='git checkout'
alias gcm='git commit -m'

function gclean
    git fetch --prune
    git branch --merged | grep -Ev "(^\*|main)" | xargs -n 1 git branch -d
    git remote prune origin
end

## git
alias addup='git add -u'
alias addall='git add .'
alias branch='git checkout -b'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias tag='git tag'
alias newtag='git tag -a'
alias main='git checkout main && git pull'

# RANDOM COLOR SCRIPT ###
# Get this script from my GitLab: gitlab.com/dwt1/shell-color-scripts
# Or install it from the Arch User Repository: shell-color-scripts
colorscript random

# Prompt

starship init fish | source
zoxide init fish | source
