#!/usr/bin/env bash

FIND=""
TARGET=""

for arg in "$@"; do
    case $arg in
        --find=*)
            FIND="${arg#*=}"
            ;;
        --target=*)
            TARGET="${arg#*=}"
            ;;
        *)
            echo -e "\033[1;31m[!] \033[0mUnknown argument: \033[0;32m$arg\033[0m"
            exit 1
            ;;
    esac
done

if [[ -z "$FIND" || -z "$TARGET" ]]; then
    echo -e "\033[1;31m[!] \033[0mUsage: \033[0;32mqfinder --find=\033[1;90m<\033[0;36mtext\033[1;90m> \033[0;32m--target=\033[1;90m<\033[0;36mpath\033[1;90m>\033[0m"
    exit 1
fi

echo -e "\033[1;34m[*] \033[0mSearching quote: \033[0;32m$FIND \033[0min \033[0;32m$TARGET\033[0m"
echo

command grep \
    -rFn \
    --binary-files=without-match \
    --exclude-dir=.git \
    --exclude=*.{png,jpg,jpeg,gif,svg,webp,ico,pdf,zip,tar,gz,bin,mp4,exe,elf} \
    "$FIND" "$TARGET" 2>/dev/null | \
        while IFS=: read -r file line_num line_content; do
            echo -ne "\033[0;32m[+] \033[0mFile: \033[0;32m$file \033[0min line \033[0;34m$line_num: \033[0;36m"
            printf '%s' "${line_content}"
            echo -ne "\033[0m\n"
        done