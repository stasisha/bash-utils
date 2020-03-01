#!/bin/bash

addLineToBottomIfNotExists() {
  local LINE=$1
  local FILE=$2
  sudo grep -qF -- "$LINE" "$FILE" || echo "$LINE" | sudo tee -a "$FILE"
}
