#!/bin/sh
echo -ne '\033c\033]0;ChaoGardenPrototype\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/ChaoGardenPrototype.x86_64" "$@"
