#! /usr/bin/env sh

SCRIPT_DIRECTORY="$(dirname -- "$(readlink -f -- "$0")")"
PROJECT_DIRECTORY="$(dirname -- "$SCRIPT_DIRECTORY")"
BUILD_DIRECTORY="$PROJECT_DIRECTORY"/build

NUMBER_OF_PROCESSORS="$(nproc)"

set -o xtrace

INITIAL_BRANCH="$(git branch --show-current)"

(
    cd "$PROJECT_DIRECTORY" \
    && git fetch --all \
    && {
        git checkout --track origin/mhwd-db \
        || git checkout mhwd-db
    } \
    && {
        git remote add upstream https://github.com/CachyOS/mhwd-db-cachyos \
        || {
            git reset --hard upstream/master \
            && git push --force origin mhwd-db
        }
    }    
)

git checkout "$INITIAL_BRANCH"

set +o xtrace