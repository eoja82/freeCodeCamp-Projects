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

echo -e "\nGuess the secret number between 1 and 1000:"

SECRET_NUMBER=400

GUESS() {
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    if [[ $1 = $SECRET_NUMBER ]]
    then
      echo You guessed it
    elif [[ $1 < $SECRET_NUMBER  ]]
    then
      # higher
      echo -e "\nIt's higher than that, guess again:"
      read NUM_GUESSED
      GUESS $NUM_GUESSED
    else
      # lower
      echo -e "\nIt's lower than that, guess again:"
      read NUM_GUESSED
      GUESS $NUM_GUESSED
    fi
  else
    echo -e "\nThat is not an integer, guess again:"
    read NUM_GUESSED
    GUESS $NUM_GUESSED
  fi
}

read NUM_GUESSED
GUESS $NUM_GUESSED