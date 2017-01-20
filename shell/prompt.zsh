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

# Define colors and their bold counterparts
for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do

  # Wrap colours between %{ %} to avoid weird gaps in autocomplete
  eval $COLOR='%{$fg_no_bold[${(L)COLOR}]%}'
  eval BOLD_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
done

# Define color reset
eval RESET='%{$reset_color%}'

# Prompt
export PS1="${CYAN}%n${RESET}@${GREEN}%m${RESET}:${BOLD_BLACK}%~${RESET} > "
