BEGIN="\[\e[1;37;41m\]"
BEGIN_TRIANGLE="\[\e[0;31;47m\]"
MIDDLE="\[\e[0;30;47m\]"
MIDDLE_TRIANGLE="\[\e[0;37m\]"
END="\[\e[m\]"
HOST_NAME="MyUbuntu"
export PS1="${BEGIN} \u@${HOST_NAME} ${BEGIN_TRIANGLE}${MIDDLE} \W ${MIDDLE_TRIANGLE}${END} "