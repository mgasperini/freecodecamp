#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ $1 =~ ^[0-9]+$ ]]
then

  ELEMENT=$($PSQL "SELECT * FROM elements WHERE atomic_number = $1;")
  PROPERTIES=$($PSQL "SELECT * FROM properties WHERE atomic_number = $1;")
  
  read ATM_NUMBER BAR SYMBOL BAR NAME <<< $(echo $ELEMENT)
  read BAR BAR ATM_MASS BAR M_POINT BAR B_POINT BAR TYPE_ID <<< $(echo $PROPERTIES)
  TYPE=$($PSQL "SELECT type FROM types WHERE type_id = $TYPE_ID ;")
  
  echo -e The element with atomic number $ATM_NUMBER is $NAME \($SYMBOL\). It\'s a $TYPE, with a mass of $ATM_MASS amu. $NAME has a melting point of $M_POINT celsius and a boiling point of $B_POINT celsius.

fi

