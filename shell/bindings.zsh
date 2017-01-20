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

# [Esc-w] - Kill from the cursor to the mark
bindkey '\ew' kill-region

# [Ctrl-k] - Kill from cursor to end of line
bindkey '^k' kill-line

# [Esc-l] - run command: ls
bindkey -s '\el' 'ls -lha\n'

# [Esc-.] - run command: cd ~
bindkey -s '\e.' 'cd ~\n'

# [Ctrl-r] - Search backward incrementally for a specified string. The string
# may begin with ^ to anchor the search to the beginning of the line.
bindkey '^r' history-incremental-search-backward

# [PageUp] - Up a line of history
bindkey '^[[5~' up-line-or-history

# [PageDown] - Down a line of history
bindkey '^[[6~' down-line-or-history

# start typing + [Up-Arrow] - fuzzy find history forward
bindkey '^[[A' up-line-or-search

# start typing + [Down-Arrow] - fuzzy find history backward
bindkey '^[[B' down-line-or-search

# [Home] - Go to beginning of line
bindkey '^[[H' beginning-of-line
bindkey '^[[1~' beginning-of-line
bindkey '^[OH' beginning-of-line

# [End] - Go to end of line
bindkey '^[[F' end-of-line
bindkey '^[[4~' end-of-line
bindkey '^[OF' end-of-line

# [Space] - do history expansion
# bindkey ' ' magic-space

# [Alt+Right-Arrow] - move backward one word
bindkey '^[b' backward-word

# [Alt+Left-Arrow] - move forward one word
bindkey '^[f' forward-word

# Make the delete key (or Fn + Delete on the Mac) work instead of outputting ~
# [Delete] - delete backward
bindkey '^?' backward-delete-char

# [fn-Delete] - delete forward
bindkey '^[[3~' delete-char
bindkey '^[3;5~' delete-char
bindkey '\e[3~' delete-char

# Emacs-style bindings
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
