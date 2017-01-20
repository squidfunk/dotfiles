source $HOME/.fresh/build/shell.sh
source $HOME/.fresh/build/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.fresh/build/zsh-completions/zsh-completions.plugin.zsh
source $HOME/.fresh/build/zsh-history-substring-search/zsh-history-substring-search.zsh

fpath=($HOME/.fresh/build/zsh-completions/src $fpath)
#fpath=($HOME/.zsh/completions $fpath)

autoload -U compinit
compinit