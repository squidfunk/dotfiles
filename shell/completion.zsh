# Copyright (c) 2017-2023 Martin Donath <martin.donath@squidfunk.com>

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

zmodload zsh/complist

# Autoload
autoload -U compinit
compinit

setopt complete_in_word

zstyle ":completion:*" completer _complete _prefix
zstyle ":completion:*" add-space true

# Smart case matching && match inside filenames
zstyle ":completion:*" \
  matcher-list "m:{a-zA-Z}={A-Za-z}" "r:|[._-]=* r:|=*" "l:|=* r:|=*"
# "m:{a-z}={A-Z}"
# zstyle ":completion:*" matcher-list "" "" "l:|=* r:|=*" "l:|=* r:|=*"

zstyle ":completion:*:*:*:*:*" menu select

# Rehash when completing commands
zstyle ":completion:*:commands" rehash 1

# Process completion shows all processes with colors
zstyle ":completion:*:*:*:*:processes" menu yes select
zstyle ":completion:*:*:*:*:processes" force-list always
zstyle ":completion:*:*:*:*:processes" command "ps -A -o pid,user,cmd"
zstyle ":completion:*:*:*:*:processes" \
  list-colors "=(#b) #([0-9]#)*=0=${color[green]}"
zstyle ":completion:*:*:kill:*:processes" \
  command "ps --forest -e -o pid,user,tty,cmd"

# List all processes for killall
zstyle ":completion:*:processes-names" \
  command "ps -eo cmd= | sed 's:\([^ ]*\).*:\1:;s:\(/[^ ]*/\)::;/^\[/d'"

# SSH usernames
if [[ -f $HOME/.ssh/config ]]; then
  _accounts=(`egrep "^User" $HOME/.ssh/config | \
    sed s/User\ // | egrep -v "^\*$"`)
  zstyle ":completion:*:users" users $_accounts
fi

# Docker
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# Colors in completion
zstyle ":completion:*:default" list-colors ${(s.:.)LS_COLORS}

# Display message when no matches are found
zstyle ":completion:*:warnings" format "%BSorry, no matches for: %d%b"

# Ignore internal zsh functions
zstyle ":completion:*:functions" ignored-patterns "_*"

# Grouping for completion types (trial)
zstyle ":completion:*:matches" group "yes"
zstyle ":completion:*:descriptions" \
  format "%{${fg_bold[magenta]}%}= %d =%{$reset_color%}"
zstyle ":completion:*" group-name ""

# Speedup path completion
zstyle ":completion:*" accept-exact "*(N)"

# Cache expensive completions
zstyle ":completion:*" use-cache on
zstyle ":completion:*" cache-path ~/.cache/zsh
