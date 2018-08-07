API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/decks"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "deck": {
      "title": "'"${TITLE}"'",
      "answer": "'"${ANSWER}"'",
      "user_id": "'"${USERID}"'"
    }
  }'

echo
