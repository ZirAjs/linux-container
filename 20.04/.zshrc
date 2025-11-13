# Set history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

# Make tab completion smarter
autoload -Uz compinit
compinit

# Enable color support
autoload -Uz colors && colors

# Prompt setup
PROMPT='%F{cyan}%n@%m%f %F{yellow}%~%f %# '

# Improve directory navigation
setopt AUTO_CD             # allows 'foldername' instead of 'cd foldername'

# Editor
export EDITOR=vim

# Aliases
alias ll='ls -lah --color=auto'
alias la='ls -A --color=auto'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias ..='cd ..'
alias ...='cd ../..'
alias please='sudo $(fc -ln -1)'

# Path setup (if needed)
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Git branch in prompt (if git is installed)
parse_git_branch() {
  git branch 2>/dev/null | sed -n '/\* /s///p'
}
PROMPT='%F{cyan}%n@%m%f %F{yellow}%1~%f $(parse_git_branch) %# '

# Enable vi-style keybindings (optional)
# bindkey -v

# Auto title bar (for some terminals)
precmd() {
  print -Pn "\e]0;%n@%m: %~\a"
}