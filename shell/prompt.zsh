# Copyright (c) 2017 Martin Donath <martin.donath@squidfunk.com>

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to
# deal in the Software without restriction, including without limitation the
# rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
# sell copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
# IN THE SOFTWARE.

# Load colors
autoload colors && colors

# Build git prompt
git_super_status() {
  precmd_update_git_vars
  if [ -n "$__CURRENT_GIT_STATUS" ]; then
    STATUS="$ZSH_THEME_GIT_PROMPT_PREFIX$ZSH_THEME_GIT_PROMPT_SEPARATOR"

    # Color branch name depending on state of repository
    if [ "$GIT_UNTRACKED" -ne "0" ]; then
      STATUS="$STATUS%{$fg_bold[red]%}$GIT_BRANCH%{${reset_color}%}"
    elif [ "$GIT_CHANGED" -ne "0" ]; then
      STATUS="$STATUS%{$fg_bold[yellow]%}$GIT_BRANCH%{${reset_color}%}"
    else
      STATUS="$STATUS%{$fg_bold[green]%}$GIT_BRANCH%{${reset_color}%}"
    fi

    # Show how local and remote repository have diverged
    if [ "$GIT_BEHIND" -ne "0" ]; then
      STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_SEPARATOR"
      STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_BEHIND"
      STATUS="$STATUS$GIT_BEHIND%{${reset_color}%}"
    fi
    if [ "$GIT_AHEAD" -ne "0" ]; then
      STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_SEPARATOR"
      STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_AHEAD"
      STATUS="$STATUS$GIT_AHEAD%{${reset_color}%}"
    fi

    # Show number of staged files
    if [ "$GIT_STAGED" -ne "0" ]; then
      STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_SEPARATOR"
      STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_STAGED"
      STATUS="$STATUS$GIT_STAGED"
    fi

    # Show number of files with conflicts
    if [ "$GIT_CONFLICTS" -ne "0" ]; then
      STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_SEPARATOR"
      STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CONFLICTS"
      STATUS="$STATUS$GIT_CONFLICTS"
    fi

    # Show number of changed files
    if [ "$GIT_CHANGED" -ne "0" ]; then
      STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_SEPARATOR"
      STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CHANGED"
      STATUS="$STATUS$GIT_CHANGED"
    fi

    # Show that there are untracked files
    if [ "$GIT_UNTRACKED" -ne "0" ]; then
      if [ "$GIT_STAGED" -eq "0" ] && [ "$GIT_CONFLICTS" -eq "0" ] &&
         [ "$GIT_CHANGED" -eq "0" ]; then
        STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_SEPARATOR"
      fi
      STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED"
    fi

    # Append suffix
    STATUS="$STATUS%{${reset_color}%}$ZSH_THEME_GIT_PROMPT_SUFFIX"
    echo "$STATUS"
  fi
}

# Configuration
ZSH_THEME_GIT_PROMPT_PREFIX="git"
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
ZSH_THEME_GIT_PROMPT_SEPARATOR="%{$fg_bold[black]%}:%{${reset_color}%}"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg_bold[green]%}%{*%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg_bold[red]%}%{×%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg_bold[red]%}%{+%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{…%G%}"

# Define prompt including git status
PS1='%{${fg[cyan]}%}%n%{${reset_color}%}@%{${fg[green]}%}%m%{${reset_color}%}:'
PS1=$PS1'%{${fg_bold[black]}%}%~%{${reset_color}%} '
PS1=$PS1'$(git_super_status)'
PS1=$PS1'> '

# Export prompt
export PS1
