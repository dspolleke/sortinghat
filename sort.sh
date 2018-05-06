#!/bin/bash
# 
# soritng hat
#
# to be used with MakeyMakey trigger built into a hat. 
#
# requires 'sox' to be installed.
# 


# set variables

timeout="10"
pausequotes="4"
sortingquotes="4"

# define function to wait for user input or timeout. 
timewait () {
  if read -t $timeout -n 1 ; 
    then 
      echo " key pressed"
      play_sorting
    else
      echo " timed out!"
      play_pause
  fi
}

# define function to play pause quotes
play_pause (){
      random=$(( ( RANDOM % $pausequotes ) + 1 ))
      play pause$random.mp3
      timewait  $timeout
}

# define function to play sorting quotes
play_sorting (){
    random=$(( ( RANDOM % $soringqoutes ) + 1 ))
    play sorting$random.mp3
    timewait $timeout
}

timewait $timeout
