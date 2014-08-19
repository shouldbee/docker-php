PROJECT=docker-php
PS1="\`if [ \$? = 0 ]; then echo \[\e[32m\]${PROJECT}\[\e[0m\]; else echo \[\e[31m\]${PROJECT}\[\e[0m\]; fi\`:\w$ "
alias php='sudo docker run -it --rm shouldbee/php php'
cd /vagrant
