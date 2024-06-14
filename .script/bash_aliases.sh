#!/bin/bash

SCRIPT_DIR=$(dirname "$(realpath "$0")")
FILE_PREFIX="${SCRIPT_DIR}/.bash_aliases."
BASH_ALIASES_FILE="$HOME/.bash_aliases"

function hasBashAliasesFunction() {
  local function_name="$1"
  if [ -f "$BASH_ALIASES_FILE" ]; then
      grep -q "function $function_name()" "$BASH_ALIASES_FILE"
      return $?
  else
    return 1
  fi
}

function updateBashAliases() {
  if [ -f "$BASH_ALIASES_FILE" ]; then
    SOURCE_FILE=$1
    functionName=$(basename "$SOURCE_FILE" | sed 's/bash.aliases.function\.//')
    if [ -f "$SOURCE_FILE" ]; then
      cat $SOURCE_FILE >> $BASH_ALIASES_FILE
      . $BASH_ALIASES_FILE
      echo "[I] function ${functionName} has been added to $BASH_ALIASES_FILE"
    else
      echo "[E] $SOURCE_FILE file not found"
      exit 1
    fi
  else
    echo "[E] $BASH_ALIASES_FILE file not found"
    exit 1
  fi
}

for file in $SCRIPT_DIR/*; do
  if [[ $(basename "$file") == bash.aliases.function.* ]]; then
    functionName=$(basename "$file" | sed 's/bash.aliases.function\.//')
    if ! hasBashAliasesFunction "$functionName"; then
      updateBashAliases "$file"
    else
      echo "[I] function $functionName already exists in $BASH_ALIASES_FILE"
    fi
  fi
done