
alias cat = bat
alias la = ls -a
alias ll = ls -l
alias vim = nvim
alias fg = job unfreeze

alias ga = git add
alias gb = git branch
alias gc = git commit
alias gC = git checkout
alias gd = git diff
alias gp = git pull
alias gP = git push
alias gr = git rebase
alias gs = git status -s

def gl [n: int = 10] {
    git log --pretty=%h»¦«%s»¦«%an»¦«%aD -n $n
    | lines
    | split column "»¦«" commit subject name date
    | upsert date {|d| $d.date | into datetime}
    | sort-by date
    | reverse
}

def --env P [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}
	rm -fp $tmp
}

def ":q" [] {
    exit
}
