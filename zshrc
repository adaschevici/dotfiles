# If you come from bash you might have to change your $PATH.
export PATH=/usr/local/bin:$HOME/bin:$HOME/.cargo/bin:$PATH


bindkey -v
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

source $HOME/.cargo/env
fpath+=~/.zfunc

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# # ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Configuring zsh-suggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=cyan,bg=bold,underline"

# Powerlevel 9k customizations
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv rbenv context dir vcs newline status)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time root_indicator background_jobs custom_wifi_signal battery time)
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL="zsh_wifi_signal"
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_BACKGROUND="orange"
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_FOREGROUND="yellow"
# Path to your oh-my-zsh installation.
export ZSH="/Users/zero/.oh-my-zsh"
# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git pyenv virtualenv zsh-nvm zsh-autosuggestions zsh-better-npm-completion)

### Golang config
export GOPATH="${HOME}/.go"
export GOPATH=$GOPATH:${HOME}/Projects/golly/
export GOPATH=$GOPATH:${HOME}/Projects/mongo-tools/
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"

### Custom functions ####

zsh_wifi_signal(){
  local output=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I)
  local airport=$(echo $output | grep 'AirPort' | awk -F': ' '{print $2}')

  if [ "$airport" = "Off" ]; then
    local color='%F{yellow}'
    echo -n "%{$color%}Wifi Off"
  else
    local ssid=$(echo $output | grep ' SSID' | awk -F': ' '{print $2}')
    local speed=$(echo $output | grep 'lastTxRate' | awk -F': ' '{print $2}')
    local color='%F{yellow}'

    [[ $speed -gt 100 ]] && color='%F{green}'
    [[ $speed -lt 50 ]] && color='%F{red}'

    echo -n "%{$color%}$ssid $speed Mb/s%{%f%}" # removed char not in my PowerLine font 
  fi
}


source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# NVM plugin config
lazynvm() {
  unset -f nvm node npm
  export NVM_DIR=~/.nvm
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
}

nvm() {
  lazynvm 
  nvm $@
}

node() {
  lazynvm
  node $@
}

npm() {
  lazynvm
  npm $@
}

function load-nvm () {
  if [[ $OSTYPE == "darwin"* ]]; then
    export NVM_DIR=~/.nvm
    [[ -s $(brew --prefix nvm)/nvm.sh ]] && source $(brew --prefix nvm)/nvm.sh
  else
    [[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh"
  fi
}

load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    if ! type nvm >/dev/null; then
      load-nvm
    fi
    nvm use
  fi
}
alias python=python3
add-zsh-hook chpwd load-nvmrc


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
