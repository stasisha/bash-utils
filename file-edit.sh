#!/bin/bash

addLineToBottomIfNotExists() {
  local LINE=$1
  local FILE=$2
  grep -qF -- "$LINE" "$FILE" || echo "$LINE" | sudo tee -a "$FILE"
}

removeLine(){
    sed -i "" -e "/^$1/d" $2
}

