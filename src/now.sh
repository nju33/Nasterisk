#!/bin/sh

fn() {
  appname=$1

  now -n "$appname" \
  && sh -c "now ls \"$appname\" | while read line; do if echo \"$line\" | grep \""$appname"-\" > /dev/null; then set $line; echo \"$2\"; break; fi; done;' | xargs -I@ now ln @ \"$appname\"" \
  && now rm "$appname" --safe --yes
}

fn $1