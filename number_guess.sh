#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

secret_number=$(($RANDOM % 1000))
number_of_guesses=0

echo $secret_number #--remove

userCheck() {
  validUser=$($PSQL "SELECT COUNT(user_id) from games FULL JOIN users USING(user_id) WHERE username='$username'")
  if [[ $validUser == 0 ]]; then
    insertNewUser=$($PSQL "INSERT INTO users(username) VALUES('$username')")
  fi
  userID=$($PSQL "SELECT user_id FROM users WHERE username='$username'")
}

gameStart() {
  echo "Guess the secret number between 1 and 1000:"
  until [[ $guess_number == $secret_number ]]
  do
    read guess_number
    #record number of tries
      score
    #check if guess_number is INT
      if [[ $guess_number =~ ^[0-9]+$ ]]; then
        #guess_number greater than secret_number
        if [[ $guess_number > $secret_number ]]; then
          echo "It's lower than that, guess again:"
      #guess_nubmer less than secret_number
        elif [[ $guess_number < $secret_number ]]; then
          echo "It's higher than that, guess again:"
      #guess_nubmer equal to secret_number
        else
          #insert the score into the games table
          insertScore=$($PSQL "INSERT INTO games(user_id,score) VALUES($userID,$number_of_guesses)")
          echo "You guessed it in $number_of_guesses tries. The secret number was $secret_number. Nice job!"
        fi
      else
        echo "That is not an integer, guess again:"
      fi
  done
}

score() {
  number_of_guesses=$(( number_of_guesses + 1 ))
} 

#initialize game
  echo "Enter your username:"
  read username
  userCheck #check username input

#if new user
  if [[ $validUser == 0 ]]; then
    echo "Welcome, $username! It looks like this is your first time here."
    gameStart
  else
#user is listed
    games_played=$($PSQL "SELECT COUNT(user_id) FROM games WHERE user_id=$userID")
    best_game=$($PSQL "SELECT MIN(score) FROM games WHERE user_id=$userID")
    echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
    gameStart
  fi


