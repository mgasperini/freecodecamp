#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

INPUT_ATOMIC_NUMBER(){
  ELEMENT=$($PSQL "SELECT * FROM elements WHERE atomic_number = $1;")
  if [[ -z $ELEMENT ]]
  then
    echo I could not find that element in the database.
    exit 0 
  fi
  PROPERTIES=$($PSQL "SELECT * FROM properties WHERE atomic_number = $1;")

  read ATM_NUMBER BAR SYMBOL BAR NAME <<< $(echo $ELEMENT)
}

INPUT_SYMBOL(){
  ELEMENT=$($PSQL "SELECT * FROM elements WHERE symbol = '$1';")
  if [[ -z $ELEMENT ]]
  then
    echo I could not find that element in the database.
    exit 0 
  fi
  read ATM_NUMBER BAR SYMBOL BAR NAME <<< $(echo $ELEMENT)
  
  PROPERTIES=$($PSQL "SELECT * FROM properties WHERE atomic_number = $ATM_NUMBER;")
}

INPUT_NAME(){
  ELEMENT=$($PSQL "SELECT * FROM elements WHERE name = '$1';")
  if [[ -z $ELEMENT ]]
  then
    echo I could not find that element in the database.
    exit 0 
  fi
  read ATM_NUMBER BAR SYMBOL BAR NAME <<< $(echo $ELEMENT)
  
  PROPERTIES=$($PSQL "SELECT * FROM properties WHERE atomic_number = $ATM_NUMBER;")
}

if [[ $1 ]]
then
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    INPUT_ATOMIC_NUMBER $1
  elif [[ $1 =~ ^[A-Z][a-z]?$ ]]
  then
    INPUT_SYMBOL $1
  elif [[ $1 =~ ^[A-Z][a-z]+$ ]]
  then
    INPUT_NAME $1

  else
    echo I could not find that element in the database.
    exit 0
  fi

  read BAR BAR ATM_MASS BAR M_POINT BAR B_POINT BAR TYPE_ID <<< $(echo $PROPERTIES)
  TYPE=$($PSQL "SELECT type FROM types WHERE type_id = $TYPE_ID ;")
  
  echo -e The element with atomic number $ATM_NUMBER is $NAME \($SYMBOL\). It\'s a $TYPE, with a mass of $ATM_MASS amu. $NAME has a melting point of $M_POINT celsius and a boiling point of $B_POINT celsius.
  
else
  echo Please provide an element as an argument.
fi

