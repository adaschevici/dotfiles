# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/zero/.oh-my-zsh
fpath+=~/.zfunc

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
plugins=(git colored-man colorize github jira vagrant virtualenv pip python brew osx zsh-syntax-highlighting zsh-autosuggestions)

DEFAULT_USER=$USER
prompt_context() {}

export GOPATH="$HOME/golibs"
export GOROOT="/usr/local/opt/go/libexec"
export GOPATH="$GOPATH:$HOME/go_scraping/crawlers"
export GOPATH="$GOPATH:$HOME/go_scraping/demo"
export GOPATH="$GOPATH:$HOME/go_play/demo"
export GOPATH="$GOPATH:$HOME/go_play"
export GOPATH="$GOPATH:$HOME/golang_projects"

export PATH=$PATH:$HOME/golibs/bin
# We no longer use docker machine but docker native instead
# export DOCKER_TLS_VERIFY="1"
# export DOCKER_HOST="tcp://192.168.99.100:2376"
# export DOCKER_CERT_PATH="/Users/zero/.docker/machine/machines/dev"
# export DOCKER_MACHINE_NAME="dev"
# # Run this command to configure your shell:
# eval "$(docker-machine env gollum)"
ulimit -n 8096

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH

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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

autoload zmv
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/Users/zero/.cargo/bin:$PATH"
export PATH="$HOME/Android/sdk/tools:$PATH"
export PATH="$HOME/Android/sdk/platform-tools:$PATH"
export RUST_SRC_PATH="/Users/zero/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# Customise the Powerlevel9k prompts
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
  custom_laptop custom_zero dir vcs newline status
)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
  command_execution_time load ram ssh background_jobs
)
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
# Add the custom Medium M icon prompt segment
POWERLEVEL9K_CUSTOM_LAPTOP="echo -n $'\uf135'"
POWERLEVEL9K_CUSTOM_LAPTOP_FOREGROUND="white"
POWERLEVEL9K_CUSTOM_LAPTOP_BACKGROUND="black"
# Add the custom freeCodeCamp prompt segment
POWERLEVEL9K_CUSTOM_ZERO="echo -n $'\uFC72' zero"
POWERLEVEL9K_CUSTOM_ZERO_FOREGROUND="white"
POWERLEVEL9K_CUSTOM_ZERO_BACKGROUND="cyan"

DEFAULT_FOREGROUND=006 DEFAULT_BACKGROUND=235

POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND="$DEFAULT_BACKGROUND"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND="$DEFAULT_FOREGROUND"
POWERLEVEL9K_EXECUTION_TIME_ICON="\uf017"

# Load Nerd Fonts with Powerlevel9k theme for Zsh
POWERLEVEL9K_MODE='nerdfont-complete'

source  ~/powerlevel9k/powerlevel9k.zsh-theme
