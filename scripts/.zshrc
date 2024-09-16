# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# --------------------------- Theme ------------------------------------
# ZSH theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# --------------------------- Paths ------------------------------------
# oh-my-zsh path
export ZSH=$HOME/.oh-my-zsh

# Support 256 colors path
export TERM="xterm-256color"

# npm ENV
# Fix EACCES permissions errors when installing packages globally
NPM_CONFIG_PREFIX=~/.npm-global

# --------------------------- Plugins ----------------------------------
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  asdf
  colored-man-pages
  extract
  F-Sy-H
  zsh-autosuggestions
  zsh-completions
)

source $ZSH/oh-my-zsh.sh

# --------------------------- Aliases ----------------------------------
# Copy SSH
alias copyssh="cat < ~/.ssh/id_ed25519.pub | clip.exe | echo '=> Public SSH key copied.'"

# Open developer directory
alias dev="${HOME}/develop"

# Open Explorer in current folder
alias explorer="explorer.exe ."

# Open .gitconfig in VSCode
alias gitcfg="vi ~/.gitconfig"

# List outdated npm packages installed globally
alias npmcheck="npm outdated -g --depth=0"

# List npm packages installed globally
alias npmlist="npm list -g --depth=0"

# Update npm packages installed globally
alias npmupdate="npm update -g"

# Open Windows user directory
alias winhome="/mnt/c/Users/$(echo $USER)"

# aliases 
alias zshcfg="vi ~/.zshrc"
alias reload="source ~/.zshrc"
alias v="nvim"
alias nvimconfig="nvim ~/.config/nvim"
alias gg="lazygit"
alias repos="cd ~/repos"
alias develop="cd ~/develop"

# Sourcing P10K
source ~/powerlevel10k/powerlevel10k.zsh-theme

