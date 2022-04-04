API_KEY="PEu9ddERyBg0cX89P8lxrj8RDY1XI0LcG5cGXOH5GLn3njXH6Fc5UC8FsH7AaokW"
URL="https://data.mongodb-api.com/app/data-cyyer/endpoint/data/beta"
CLUSTER="BashWordle"

# Get list of words from JSON file in source GitHub repo and insert them
# into the DB.
curl --location --request POST  $URL'/action/insertMany' \
  --header 'Content-Type: application/json' \
  --header 'Access-Control-Request-Headers: *' \
  --header 'api-key: '$API_KEY \
  --data-raw '{
    "collection":"words",
    "database":"wordle",
    "dataSource":"'$CLUSTER'",
    "documents": '$(curl -s https://raw.githubusercontent.com/mongodb-developer/bash-wordle/main/words.json)'
}'
