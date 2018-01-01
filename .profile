#Get the Prompt
export PS1="\[\e[36m\][\[\e[m\]\[\e[32m\]\d\[\e[m\] \[\e[32m\]\t\[\e[m\]\[\e[36m\]]\[\e[m\] \[\e[31m\]\u\[\e[m\]\[\e[36m\]:\[\e[m\]\[\e[34m\]\W\[\e[m\]\[\e[32m\]\\$\[\e[m\] "

#Aliases
alias ll="ls -lah"

#setup for VirtualEnvironments
export WORKON_HOME=~/VirtualEnvironments
source /usr/local/bin/virtualenvwrapper.sh
