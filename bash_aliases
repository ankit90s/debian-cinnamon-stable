# nvim Alias
alias vi='nvim'

# clear screen alias
# alias c='clear && uname -rs'
alias c='clear && pfetch'

# change directory
alias ..='cd ..'

# Translate shell
alias tl='trans'

# Kdeconnect
alias share='kdeconnect-cli -d $(kdeconnect-cli -a --id-only) --share'

# Browse Phone
alias phone='cd /run/user/1000/gvfs'

# Copy
alias cp="cp -i"
alias mv="mv -i"

# Singapore time
alias singapore='TZ='Asia/Singapore' date'

# music
# alias romance="mpv --no-video https://youtu.be/3M9Oh4Hq1qE"
alias romance="mpv https://youtu.be/3M9Oh4Hq1qE"

# git commit
alias commit='git commit -m updates'
