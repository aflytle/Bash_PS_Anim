ghostArr=`ls *.txt`

#echo $ghostArr

# function userKey () {

# }

function moveright () {
    sed 's/^/    /' $1
}

function moveleft () {
    for i in "$@"
    do 
        sed 's/^[ \t]//' $i
        # s/ substitute
        # ^ start of line
        # [ \t] one or more blanks including tab
        # // replaces with empty string
    done
}


function hover () {
    while [ 1 ]
    do 
        for i in "$@" #reads all arguments like an array
        do
            clear
            #echo $i
            #tput setaf {2}
            #echo "$i"
            cat $i 
            sleep 1 #sleep 1 second
        done
    done
}

function hoverWithMoveRight () {
    while [ 1 ]
    do 
        for i in "$@" #reads all arguments like an array
        do
            clear
            #echo $i
            #tput setaf {2}
            #echo "$i"
            read -sn1 input
            if $input==d
            then
                for j in "$@"
                moveright $j
            fi
            cat $i 
            sleep 1 #sleep 1 second
        done
    done
}

#hover ${ghostArr[@]} #in bash, we have to enumerate the object before feeding it to the function for some reason

hoverWithMoveRight ghost1_test.txt