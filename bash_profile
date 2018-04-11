export EDITOR=nvim
export PS1="🔥  \u@ \w $ "
alias v=nvim
alias l='ls -lGpFh'
alias grep='grep --color=auto'
alias du='du -sh'
alias code='cd ~/Documents/code/'
alias start_eclim='Xvfb :1 -screen 0 1024x768x24 & DISPLAY=:1 /Applications/eclipse/Eclipse.app/Contents/Eclipse/eclimd -b'

#Avoid "ed: RE error: illegal byte sequence" from git-completion.bash
export LANG=C
source ~/.git-completion.bash
