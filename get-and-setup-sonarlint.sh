#!/usr/bin/env bash

info() {
    echo info: "$@"
}

fatal() {
    echo fatal: "$@"
    exit 1
}

release=2.2-SNAPSHOT
unzip -o ./sonarlint-cli/sonarlint-cli-$release.zip -d ~ || {
    fatal 'failed to unzip the file'
}

info "checking sonarlint executability"
if ! type ~/sonarlint-cli-$release/bin/sonarlint &>/dev/null; then
    cat << "EOF" >&2

*******************************************************************************
fatal: it seems ~/sonarlint-cli-$release/bin is not on PATH
*******************************************************************************
EOF
    exit 1
fi
