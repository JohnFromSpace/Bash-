#!/usr/bin/env bash

raindrop=""

(($1 % 3 == 0)) && raindrop+="Pling"
(($1 % 5 == 0)) && raindrop+="Plang"
(($1 % 7 == 0)) && raindrop+="Plong"

[ -z "$raindrop" ] && echo "$1" || echo "$raindrop"
