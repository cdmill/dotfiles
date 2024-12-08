zoxide init fish | source
fzf --fish | source
abbr --add go git checkout
abbr --add gc git commit
abbr --add gp git push
abbr --add gs git s
abbr --add assgn "cp -r ~/Developer/tex/templates/assignment-template"
abbr --add wrtg "cp -r ~/Developer/tex/templates/wrtg-template"

alias vim="nvim"
alias sed="sed -E"
alias ls="eza --icons --group-directories-first"
alias lsl="eza -l -h --no-user --git"
alias tree="eza -T"
alias grep="grep --color=auto"
alias top="top -n 25 -s 3"
alias fd="fd -c never"
alias timeit="/usr/bin/time -p"

alias cade="ssh u1337847@lab1-13.eng.utah.edu"
alias transfer="sftp u1337847@lab1-13.eng.utah.edu"
alias ssh="TERM=xterm-256color $(which ssh)"

alias python="python3.13"
alias conda+="conda activate"
alias conda-="conda deactivate"
alias pydb="python -m pdb"

alias uni="cd ~/self/Developer/uni/"
alias notes="vim ~/self/notes/main/hedef.md"
alias conf="cd ~/.config/"
alias ic="cd /Users/caseymiller/Library/Mobile\ Documents/com~apple~CloudDocs"

set -U fish_greeting
set -gx LANG en_US.UTF-8
set -gx TERM xterm-256color
set -gx HOMEBREW_NO_ENV_HINTS 1
set -gx RUST_BACKTRACE 1
set -U EDITOR nvim

set -gx __zoxide_zi cdi
set -gx FZF_DEFAULT_OPTS '
--color=fg:#adadcc,bg:#121315,hl:#ad82a2,gutter:#121315
--color=fg+:#adadcc,bg+:#16171b,hl+:#9bbdb8
--color=info:#666a82,prompt:#ad82a2,pointer:#ad82a2
--color=marker:#6397cf,spinner:#6397cf,header:#6397cf
--separator="─" --scrollbar="│" --layout="reverse" --info="right"
--prompt="> "
--marker="*"
--pointer=">"
--cycle
--multi
--height 40%
--preview "bat --style=numbers,changes --wrap auto --decorations always --color never {} || cat {} || tree -C {}"
--preview-window="right:60%:hidden:noborder" 
--bind="?:toggle-preview"
--bind="ctrl-u:preview-page-up"
--bind="ctrl-d:preview-page-down"'
#--preview-window="right:60%:hidden" 

fish_add_path $HOME/.local/bin/scripts/
fish_add_path $HOME/Library/Python/3.12/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/homebrew/Caskroom/miniconda/base/bin/conda
    eval /opt/homebrew/Caskroom/miniconda/base/bin/conda "shell.fish" hook $argv | source
else
    if test -f "/opt/homebrew/Caskroom/miniconda/base/etc/fish/conf.d/conda.fish"
        . "/opt/homebrew/Caskroom/miniconda/base/etc/fish/conf.d/conda.fish"
    else
        set -x PATH /opt/homebrew/Caskroom/miniconda/base/bin $PATH
    end
end
# <<< conda initialize <<<
