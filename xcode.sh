#!/bin/bash

install-xcode(){
  command -v xcode-select >/dev/null 2>&1 || {
    echo >&2 "Installing xcode-select..."
    xcode-select --install
}

