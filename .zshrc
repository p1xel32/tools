# Set ZSH environment variables.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$ZSH/custom"

# Set name of the theme to load. 
ZSH_THEME="af-magic"
#Set list of themes to pick from when loading at random
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Set Zsh options.
setopt AUTO_CD         # automatically change to a directory when changing to its path
setopt CORRECT         # auto-correct commands
setopt HIST_IGNORE_ALL_DUPS  # ignore duplicates in history
setopt HIST_FIND_NO_DUPS     # do not display duplicates when searching history
setopt HIST_IGNORE_SPACE     # ignore commands that start with a space
setopt HIST_SAVE_NO_DUPS     # do not save duplicates in history
setopt HIST_EXPIRE_DUPS_FIRST # expire duplicates first when trimming history
export HISTSIZE=100000        # set size of history to 100,000 commands
setopt SHARE_HISTORY          # share history between all sessions
setopt INC_APPEND_HISTORY     # append to history file, don't overwrite it
setopt PROMPT_SUBST           # allow substitution in prompt
setopt NO_CASE_GLOB           # case sensitive globbing
setopt GLOB_COMPLETE          # when completing from the beginning of a word, include all possible completions

# Load plugins.
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search)

# Load Oh My Zsh.
source $ZSH/oh-my-zsh.sh

# Define some aliases.
alias ls='ls -G'
alias ll='ls -lh'
alias la='ls -A'
alias lla='ls -lah'
alias grep='grep --color=auto'
alias vi='vim'

# Define some quick commands.
alias c='clear'
alias e='$EDITOR'
alias l='ls -F'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias tree='tree -C'
alias pbc='pbcopy'
alias pbp='pbpaste'
alias h='history'
alias j='jobs -l'
alias k='kill -9'
alias now='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'

#zsh-completions
autoload -Uz compinit && compinit

# Add custom PATHs.
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-which/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/make/libexec/gnub:$PATH"

# Handle command not found errors.
function command_not_found_handler() {
  if [[ -x /usr/libexec/path_helper ]]; then
    /usr/libexec/path_helper
  fi
}

#zsh-completions
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
  fi
#Load custom plugins
source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh
