#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess --tuples-only -c"

echo -e "\n~~Number guessing game ~~\n\nEnter your username:"

read NAME_ENTERED

USER=$($PSQL "SELECT games_played, best_game FROM users WHERE name = '$NAME_ENTERED'")

if [[ -z $USER ]]
then
  echo -e "\nWelcome, $NAME_ENTERED! It looks like this is your first time here."
else
  echo "$USER" | while read GP BAR BG
  do
    echo -e "\nWelcome back, $NAME_ENTERED! You have played $GP games, and your best game took $BG guesses."
  done  
fi