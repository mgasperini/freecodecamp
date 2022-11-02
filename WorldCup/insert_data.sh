#! /bin/bash

if [[ $1 == "test" ]]
then
  echo -e "\n~~~ test ~~~\n"
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo "$($PSQL "SELECT * FROM games;")"

CONTADOR=0
cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $CONTADOR == 0  ]]
  then
    (( CONTADOR++ ))
    continue
  fi
  # echo $YEAR - $ROUND - $WINNER - $OPPONENT - $WINNER_GOALS - $OPPONENT_GOALS
  
  # get teams_id
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER';")
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT';")
  
  # Insert Winner if not exists
  if [[ -z $WINNER_ID ]]
  then
    $($PSQL "INSERT INTO teams(name) VALUES('$WINNER');")
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER';")
  fi
  # Insert opponent if not exists
  if [[ -z $OPPONENT_ID ]]
  then
   $($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT');")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT';")
  fi



$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS);")


done
