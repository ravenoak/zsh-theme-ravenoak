# ZSH Theme - Preview: http://dl.dropbox.com/u/FIXME/pics/ravenoak-zsh-theme.png
# Based on gnzh<-bira theme

# load some modules
autoload -U colors zsh/terminfo # Used in the colour alias below
colors
setopt prompt_subst

# Check the UID
if [[ $UID -ne 0 ]]; then # normal user
  eval PR_USER='${FG[123]}%n${FX[reset]}'
  local PR_PROMPT='${FX[reset]}➤${FX[reset]}'
else # root
  eval PR_USER='${FG[196]}%n${FX[reset]}'
  local PR_PROMPT='${FG[196]}!!!➤${FX[reset]}'
fi

# Check if we are on SSH or not
if [[ -n "${SSH_CLIENT}"  ||  -n "${SSH2_CLIENT}" ]]; then
  eval PR_HOST='${FG[142]}%M${FX[reset]}' #SSH
else
  eval PR_HOST='${FG[213]}%M${FX[reset]}' # no SSH
fi

local return_code="%(?..${FG[001]}%? ↵${FX[reset]})"

ZSH_THEME_GIT_PROMPT_PREFIX="‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="›"

local user_host='${PR_USER}${FG[141]}@${FX[reset]}${PR_HOST}'
local current_dir='${FG[221]}%~${FX[reset]}'
local git_info='${FG[083]}$(git_prompt_info)${FX[reset]}'
local pyenv_info='${FG[026]}$(pyenv_prompt_info)${FX[reset]}'

PROMPT="╭─${user_host} ${current_dir} ${git_info} ${pyenv_info}
╰─$PR_PROMPT  "
RPS1="${return_code}"
