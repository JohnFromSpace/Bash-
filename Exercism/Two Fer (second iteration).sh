#!/usr/bin/env bash

main () {
    name=${1}
    printf "One for %s, one for me.\n" "${name:=you}"
}

main "$@"
