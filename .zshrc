# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# 
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# load prompt plugin
fpath+=("$(brew --prefix)/share/zsh/site-functions")

# history
HISTSIZE=30
HISTFILE=~/.zsh_history
SAVEHIST=30
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# aliases
alias hist="rm .zsh_history .Rhistory .bash_history .python_history"
alias ystop="yabai --stop-service"
alias ystart="yabai --start-service"
alias ls="exa --icons --group-directories-first"
alias tree="exa --icons --group-directories-first -T --level=2"
alias cade="ssh u1337847@lab1-13.eng.utah.edu"
alias transfer="sftp u1337847@lab1-13.eng.utah.edu"
alias vim="nvim"
alias ssh="TERM=xterm-256color $(which ssh)"

# add directory to PATH
path+=('/Users/caseymiller/Library/Python/3.11/bin')
export PATH

source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

