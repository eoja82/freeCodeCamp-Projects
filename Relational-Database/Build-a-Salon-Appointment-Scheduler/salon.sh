#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

SERVICES=$($PSQL "SELECT * FROM services ORDER BY service_id")

MAIN_MENU() {
  echo -e "\nWelcome to My Salon, how can I help you?\n"

  # print message if message
  if [[ $1 ]]
  then
    echo -e "$1\n"
  fi

  # list services
  echo "$SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done
  echo -e "x) exit\n"

}


EXIT() {
  echo -e "\nThank you for stopping in.\n"
}

MAIN_MENU