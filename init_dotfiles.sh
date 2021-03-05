#!/usr/bin/env bash

CURRENT_DIR=`pwd`
BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ $CURRENT_DIR == $BASE_DIR ]; then
  echo 'same directory, exiting.'
  exit 1
fi


if [ ! -d "$CURRENT_DIR/.vscode" ]; then
  echo 'create .vscode'
  mkdir "$CURRENT_DIR/.vscode"
fi

# cp "$BASE_DIR/.vscode/*" "$CURRENT_DIR/.vscode/"
for file in $BASE_DIR/.vscode/*; do
  filename="${file##*/}"
  if [ -f $CURRENT_DIR/.vscode/$filename ]; then
    echo "skip $filename"
  else
    echo "cp $filename"
    cp "$file" "$CURRENT_DIR/.vscode"
  fi
done


for file in ".gitignore" ".eslintrc.json" ".prettierrc"; do
  if [ -f $CURRENT_DIR/$file ]; then
    echo "skip $file"
  else
    echo "cp $file"
    cp "$BASE_DIR/$file" "$CURRENT_DIR/"
  fi
done

