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

  # get service
  read SERVICE_ID_SELECTED

  # if x case insensitve exit
  if [[ $SERVICE_REQUESTED =~ ^[x|X]$ ]]
  then
    EXIT
  else
    # check if SERVICE_ID is a number
    if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
    
    # if not a number send to MAIN_MENU
    then
      MAIN_MENU "I could not find that service. What would you like today?"
    
    # check if number entered is a service
    else
      SERVICE_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED'")

      # if not a service send back to MAIN_MENU
      if [[ -z $SERVICE_SELECTED ]]
      then
        MAIN_MENU "I could not find that service. What would you like today?"
      else
        # get customer info
        echo -e "\nWhat's your phone number?"
        read CUSTOMER_PHONE

        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

        # if customer doesn't exist
        if [[ -z $CUSTOMER_NAME ]]
        then
          # get new customer name
          echo -e "\nI don't have a record for that phone number, what's your name?"
          read CUSTOMER_NAME

          # insert new customer
          INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')") 
        fi

        # get customer_id
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

        # get appointment time
        SERVICE_SELECTED_FORMATTED=$(echo $SERVICE_SELECTED | sed 's/ |/"/')
        CUSTOMER_NAME_FORMATED=$(echo $CUSTOMER_NAME | sed 's/ |/"/')

        echo -e "\nWhat time would you like your $SERVICE_SELECTED_FORMATTED, $CUSTOMER_NAME_FORMATED?"
        read SERVICE_TIME

        INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

        echo -e "\nI have put you down for a $SERVICE_SELECTED_FORMATTED at $SERVICE_TIME, $CUSTOMER_NAME_FORMATED."

      fi

    fi

  fi


}


EXIT() {
  echo -e "\nThank you for stopping in.\n"
}

MAIN_MENU