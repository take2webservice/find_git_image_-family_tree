#!/bin/sh
exec_inspect() {
  image="$1"
  if [ -z "$image" ]; then
    echo "Please input first arg as image_id."
    return
  fi
  parent_id=`docker inspect $image | grep Parent | sed -e 's/"Parent": "sha256://g' | sed -e 's/",//g' | sed -e 's/ //g'`
  parent_id=${parent_id:0:12}
  echo "parent_id:$parent_id"
  exec_inspect $parent_id
}

exec_inspect $1
