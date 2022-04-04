WORD=MONGO
TRIES=0
GO_ON=1
while [ $GO_ON -eq 1 ]
do
  # Increment TRIES
  TRIES=$(expr $TRIES + 1)
  # Get user input with maximum 5 letters
  read -n 5 -p "What is your guess: " USER_GUESS
  # Transfer all input string to upper case using awk tool
  USER_GUESS=$(echo "$USER_GUESS" | awk '{print toupper($0)}')

  # Put Green box if letter is correct in place, yellow if letter correct
  # in a different place, and black otherwise. Then print the result.
  STATE=""
  for i in {0..4}
  do
    if [ "${WORD:i:1}" == "${USER_GUESS:i:1}" ]
    then
      STATE=$STATE"🟩"
    elif [[ $WORD =~ "${USER_GUESS:i:1}" ]]
    then
      STATE=$STATE"🟨"
    else
      STATE=$STATE"⬛️"
    fi
  done
  echo "  "$STATE

  if [ $USER_GUESS == $WORD ]
  then
    echo "\nYou won!"
    GO_ON=0
  elif [ $TRIES == 5 ]
  then
    echo "\nYou failed.\nThe word was "$WORD
    GO_ON=0
  fi
done
