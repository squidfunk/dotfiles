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

# Navigation
alias ~="cd ~"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../../"
alias .....="cd ../../../../"

# Ring the terminal bell and put a badge on Terminal.app’s Dock icon, which is
# useful when executing time-consuming commands)
alias notify="tput bel"

# Intuitive map function, for example, to list all directories that contain a
# certain file: find . -name .gitattributes | map dirname
alias map="xargs -n1"

# Lock the screen
alias afk="$HOME/.dotfiles/bin/afk"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias cleanup="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; \
  sudo rm -rfv /private/var/log/asl/*.asl"

# Refresh shell
alias refresh="fresh && source $HOME/.zshrc && reset"

# Hide/show all desktop icons (useful when presenting)
alias desktop-hide="defaults write com.apple.finder CreateDesktop \
  -bool false && killall Finder"
alias desktop-show="defaults write com.apple.finder CreateDesktop \
  -bool true && killall Finder"

# Docker cleanup
alias docker-stop-all="docker rm -f $(docker ps -q -a)"
alias docker-remove-dangling=" \
  docker rmi -f $(docker images -q -f dangling=true)"
alias docker-remove-all="docker rmi -f $(docker images -q)"
alias docker-purge=" \
  docker-stop-all && \
  docker-remove-all && \
  docker rm `docker ps -aq --no-trunc --filter 'status=exited'` && \
  docker rmi `docker images --filter 'dangling=true' -q --no-trunc`"

# Merge PDF files: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias pdf-merge="/System/Library/Automator/\
Combine\ PDF\ Pages.action/Contents/Resources/join.py"
