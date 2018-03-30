source  ~/powerlevel9k/powerlevel9k.zsh-theme
alias ls="ls -lG -1"
alias ll="ls -lahG"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

POWERLEVEL9K_COLOR_SCHEME='light'
POWERLEVEL9K_CONTEXT_TEMPLATE="%n"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_DIR_OMIT_FIRST_CHARACTER=true
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status nvm node_version)
POWERLEVEL9K__PROMPT_DIR_HOME_FOREGROUND="white"
POWERLEVEL9K__PROMPT_DIR_HOME_SUBFOLDER_FOREGROUND="white"
POWERLEVEL9K__PROMPT_DIR_DEFAULT_FOREGROUND="white"


## Backup original prompt_dir function to _prompt_dir
eval "`declare -f prompt_dir | sed '1s/.*/_&/'`"
prompt_dir() {
  # Never omit first character
  POWERLEVEL9K_DIR_OMIT_FIRST_CHARACTER=false
  # Except if current directory is longer than one character
  local currentDirectory=$(print -P "%~")
  [[ ${#currentDirectory} -gt 1 ]] && POWERLEVEL9K_DIR_OMIT_FIRST_CHARACTER=true

  # Call original prompt_dir function
  _prompt_dir "${1}" "${2}"

}

export PATH="/usr/local/opt/ipython@5/bin:$PATH"
