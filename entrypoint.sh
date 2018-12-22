#!/bin/sh -e

CONFIG_FILE=/home/ngrok/ngrok.yml

if [ ! -f $CONFIG_FILE ]; then
  if [ -z "$CONFIG_STRING" ]; then
    echo "You must specify a CONFIG_STRING or provide $CONFIG_FILE file via volume to configure ngrok."
    exit 1
  else
    echo "$CONFIG_STRING" > $CONFIG_FILE
  fi
fi

echo "Running ngrok using following configuration:"
cat $CONFIG_FILE

ngrok start --all -config $CONFIG_FILE
