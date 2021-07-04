#!/usr/bin/env bash

echo "configuring git credentials..."

# ref https://gist.github.com/cdown/1163649
urlencode() {
    # urlencode <string>
    old_lc_collate=$LC_COLLATE
    LC_COLLATE=C

    local length="${#1}"
    for (( i = 0; i < length; i++ )); do
        local c="${1:i:1}"
        case $c in
            [a-zA-Z0-9.~_-]) printf "$c" ;;
            *) printf '%%%02X' "'$c" ;;
        esac
    done

    LC_COLLATE=$old_lc_collate
}

git config --global url.https://gitlab-ci-token:$(urlencode ${CI_JOB_TOKEN})@gitlabadress/.insteadOf https://gitlabadress/

echo "configuring git credentials... done"
