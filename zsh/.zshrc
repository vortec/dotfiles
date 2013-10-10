# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="vortec"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git lol osx pip redis-cli sublime zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
HISTFILE=~/.zsh_histfile
HISTCONTROL=ignoredups
HISTSIZE=50000
SAVEHIST=50000
DIRSTACKSIZE=12

# Local pip server
export PIP_INDEX_URL=http://pdc.local:3443/simple

# Virtualenvwrapper
source /usr/local/bin/virtualenvwrapper.sh
#export WORKON_HOME=/Users/fkochem/workspace/virtualenvs
#export PROJECT_HOME=/Users/fkochem/workspace/projects
export WORKON_HOME=/opt/cate2/instances
export GOPATH=/Users/fkochem/workspace/gopath

# VCS_INFO #
# ======== #
setopt promptsubst
autoload -Uz vcs_info

# Enable only a subset of possible vcs
zstyle ':vcs_info:*' enable git bzr hg darcs svn

# Enable changes monitoring (only git)
zstyle ':vcs_info:git:*' check-for-changes true

# Strings used when there are staged/unstaged changes
zstyle ':vcs_info:git:*' unstagedstr '¹'
zstyle ':vcs_info:git:*' stagedstr '²'
zstyle ':vcs_info:hg:*' check-for-changes true
zstyle ':vcs_info:hg:*' get-revision true

# rev+changes branch misc
zstyle ':vcs_info:hg*' formats '%F{4}(%f%s%F{4})%F{3}-%F{4}[%F{2}%i%u %b %m%F{4}]%f'
zstyle ':vcs_info:hg*' actionformats '%F{4}(%f%s|%a%F{4})%F{3}-%F{4}[%F{2}%i%u %b %m%F{4}]'
zstyle ':vcs_info:hg*:*' get-bookmarks true
zstyle ':vcs_info:hg*:*' get-mq true
zstyle ':vcs_info:hg*:*' get-unapplied true
zstyle ':vcs_info:hg*:*' patch-format "mq(%g):%n/%c %p"
zstyle ':vcs_info:hg*:*' nopatch-format "mq(%g):%n/%c %p"
zstyle ':vcs_info:hg*:*' unstagedstr "+"
zstyle ':vcs_info:hg*:*' hgrevformat "%r" # only show local rev.
zstyle ':vcs_info:hg*:*' branchformat "%b" # only show branch

# Standard vcs string
# %{N} is the color switcher ex. %F{5} is violet
# %f is the 'reset color' escape
zstyle ':vcs_info:*'           formats       '%F{4}(%f%s%F{4})%F{3}-%F{4}[%F{2}%b%c%u%F{4}]%f'
zstyle ':vcs_info:*'           actionformats '%F{4}(%f%s%F{4})%F{3}-%F{4}[%F{2}%b%F{3}|%F{1}%a%F{4}]%f '
zstyle ':vcs_info:(svn|bzr):*' branchformat  '%b%F{1}:%F{3}%r'

precmd () { vcs_info }
PROMPT='%F{4}[%F{7}%n%F{4}@%F{2}%m%F{4}] %F{3}%3~ ${vcs_info_msg_0_}%f$ '
RPROMPT='†: %F{7}%?'

export PATH=$PATH:/usr/local/sbin