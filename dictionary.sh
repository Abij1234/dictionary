#!/usr/bin/env bash

#========== Progress function ===========
prog(){
. progress/loding.sh
progee
}


#::::::::::: Requirments :::::::::
pack=(python python2 pv)
for i in "${pack[@]}"; do
if ! hash $i > /dev/null 2>&1; then
printf "\033[1;31mINSTALLING BASIC PACKAGES...... \033[0m\n"
pkg install $i -y
fi
done

lolc=(lolcat)
for a in "${lolc[@]}"; do
if ! hash $a > /dev/null 2>&1; then
printf "\033[1;31mINSTALLING LOLCAT \033[0m\n"
pip install $a -y
fi
done

#<!!!!!!!!!!! Colour code !!!!!!!!!!!>
S0="\033[1;30m" B0="\033[1;40m"
S1="\033[1;31m" B1="\033[1;41m"
S2="\033[1;32m" B2="\033[1;42m"
S3="\033[1;33m" B3="\033[1;43m"
S4="\033[1;34m" B4="\033[1;44m"
S5="\033[1;35m" B5="\033[1;45m"
S6="\033[1;36m" B6="\033[1;46m"
S7="\033[1;37m" B7="\033[1;47m"
R0="\033[00m"   R1="\033[1;00m"

#//////////// programe ///////////////
echo -e "


        █▀▄ █ █▀▀ ▀█▀ █ █▀█ █▄░█ ▄▀█ █▀█ █▄█
        █▄▀ █ █▄▄ ░█░ █ █▄█ █░▀█ █▀█ █▀▄ ░█░
       ---------------------------------------
              Coded by : NNC @ Abijith p
        --------------------------------------" | pv -qL 200 | lolcat
echo
printf "${S4}[*]${R0}${S6}ENTER THE WORD HEAR ==>${R0}"
read word
echo
prog
echo
RESPONSE=$(curl -fsSL "http://api.urbandictionary.com/v0/define?term=${word}" | jq -r .list[].definition)
printf "${S4}RESULTS:${R0}\n${S6}${RESPONSE}${R0}\n"
