PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

# check for argument
if [[ -z $1 ]]
then
  # exit if no argument
  echo Please provide an element as an argument.
else
  # check if $1 is a number
  echo -e "\n \$1 is $1"
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    # get element
    ELEMENT_DATA=$($PSQL "SELECT atomic_mass, melting_point_celsius, boiling_point_celsius, symbol, name, type FROM properties INNER JOIN elements ON properties.atomic_number = elements.atomic_number INNER JOIN types ON properties.type_id = types.type_id WHERE properties.atomic_number = $1;")
    if [[ ! -z $ELEMENT_DATA ]]
    then
      # elment found
      # echo Element found
      echo "$ELEMENT_DATA" | while read AM BAR MPC BAR BPC BAR SYM BAR NAME BAR TYPE
      do
        echo "The element with atomic number $1 is $NAME ($SYM). It's a $TYPE, with a mass of $AM amu. $NAME has a melting point of $MPC celsius and a boiling point of $BPC celsius."
      done
    else
      # element not found 
      echo -e "\nI could not find that element (AN) in the database.\n"
    fi
  else
    echo -e "\nI could not find that element (END) in the database.\n"
  fi

fi
