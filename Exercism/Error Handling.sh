#!/usr/bin/env bash

usage() {
  echo "Usage: ${0##*/} <person>"
}

main () {
  local name="$1"
  if [[ $# -ne 1 ]]; then
    usage
    return 1
  fi
  echo "Hello, ${name}"
}

main "$@"
