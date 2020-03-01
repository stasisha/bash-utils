#!/bin/bash

addLineToBottomIfNotExists() {
  local LINE=$1
  local FILE=$2
  sudo grep -qF -- "$LINE" "$FILE" || echo "$LINE" | sudo tee -a "$FILE"
}

addLineToTopIfNotExists() {
  local LINE=$1
  local FILE=$2
  sudo grep -qF -- "$LINE" "$FILE" || echo -e  "$LINE""\n$(cat todo.txt)" > todo.txt
}

addLineBeforeLineIfNotExists() {
  local LINE=$1
  local BEFORE=$2
  local FILE=$3
  sudo grep -qF -- "$LINE" "$FILE" || sed  "/${BEFORE}/ { N; s/cat\n/${LINE}\n&/ }" "$FILE"
}

