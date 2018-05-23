#!/bin/bash
# 
# soritng hat
#
# to be used with MakeyMakey trigger built into a hat. 
#
# requires 'sox' to be installed.
# 


# set variables
timeout='10'
mypath='home/dspolleke/sorting'
ppath="$(mypath)/pause/"
pausequotes='4'
spath="$(mypath)/sorting/"
sortingquotes='4'
cpath="$(mypath)/contemplate/"
contequotes='4'
epath="$(mypath)/contemplate/"
endquotes='1'


# define function to wait for user input or timeout. 
timewait () {
  if read -t $(timeout) -n 1 ; 
    then 
      #echo ' key pressed'
      play_sorting
    else
      #echo ' timed out!'
      play_pause
  fi
}

# define function to play pause quotes
play_pause (){
      random=$(( ( RANDOM % $(pausequotes) ) + 1 ))
      play "$(ppath)pause$(random).mp3"
      timewait  $(timeout)
}

# define function to play sorting quotes
play_sorting (){
    # play random contemplation quote
    random=$(( ( RANDOM % $(contequotes) ) + 1 ))
    play $(cpath)contemplate$(random).mp3
    sleep 5
    # play random decision
    random=$(( ( RANDOM % $(sortingquotes) ) + 1 ))
    play "$(spath)sorting$(random).mp3"
    sleep 5
    # ask player to put down hat
    random=$(( ( RANDOM % $(endquotes) ) + 1 ))
    play "$(epath)end$(random).mp3"
    # long sleep to give player time to put down hat.
    sleep 15
    # call function to restart from the beginning
    timewait $(timeout)
}

timewait $(timeout)
