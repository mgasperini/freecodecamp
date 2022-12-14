#!/bin/bash

# Program variables

NUMBER_TO_GUESS=$(( $RANDOM%1000 + 1 ))
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
INTENTOS=1

#echo $NUMBER_TO_GUESS

# Program functions

CHECK_NUMBER_GUESSED(){

  echo "Guess the secret number between 1 and 1000:"
  read GUESS

  
  while ! $( [[ $GUESS -eq $NUMBER_TO_GUESS ]] )
  do
    if [[ ! $GUESS =~ ^[0-9]{1,4}$ ]]
    then
      echo "That is not an integer, guess again:"
      read GUESS
    else
      INTENTOS=$(($INTENTOS + 1))
      if [[ $GUESS -lt $NUMBER_TO_GUESS ]]
      then
        echo "It's higher than that, guess again:"
      else
        echo "It's lower than that, guess again:"
      fi
      read GUESS
    fi
  done
}


WELCOME_USER(){
  echo "Enter your username:"
  read USERNAME

  USERNAME_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$USERNAME';")
  if [[ -z $USERNAME_ID ]]
  then
    INSERT_NAME=$($PSQL "INSERT INTO users(name) VALUES('$USERNAME');")
    USERNAME_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$USERNAME';")
    echo "Welcome, $USERNAME! It looks like this is your first time here."
  else
    GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM guesses WHERE user_id = $USERNAME_ID;")
    BEST_GAME=$($PSQL "SELECT MIN(number_guesses) FROM guesses WHERE user_id = $USERNAME_ID;")
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi

}

UPDATE_TABLE(){
  echo "You guessed it in $INTENTOS tries. The secret number was $NUMBER_TO_GUESS. Nice job!"
  INSERT_GUESS_RESULT=$($PSQL "INSERT INTO guesses(user_id, number_guesses) VALUES($USERNAME_ID, $INTENTOS);")

}

WELCOME_USER
CHECK_NUMBER_GUESSED
UPDATE_TABLE
