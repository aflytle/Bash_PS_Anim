#!/bin/bash

#taken from tutorial by Kris Occhipinti

color='\033[32;45m'

#script for coin flip animation
coinFlipArray=(
"\n     \n     \nxxxxx\n     \n     "
"\nx    \n x   \n  x  \n   x \n    x"
"\n  x  \n  x  \n  x  \n  x  \n  x  "
"\n    x\n   x \n  x  \n x   \nx    "
)

coinFlip(){
    while [ 1 ]
    do
        for i in "${coinFlipArray[@]}"
        do
            clear
            echo -ne "\r$i" #n means no new line
        #   e means special characters, r means reset
            sleep 0.2
        done
    done
}



#script for wait time spinner
spinner=( Oooo oOoo ooOo oooO )

spin(){
    while [ 1 ]
    do
        for i in "${spinner[@]}"
        do
            clear
            echo -ne "\r$i" #n means no new line
        #   e means special characters, r means reset
            sleep 0.2
        done
    done
}

#script for ghost animation

ghostArr=($(ls *.txt))

hover(){
    while [ 1 ]
    do 
        for i in "${ghostArr[@]}"
        do
            clear
            #echo $i
            #tput setaf {2}
            cat $i 
            sleep 1
        done
    done
}


#Execution codes

#spin

#coinFlip

hover