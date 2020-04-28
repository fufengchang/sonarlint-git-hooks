#!/usr/bin/env bash

info() {
    echo info: "$@"
}

fatal() {
    echo fatal: "$@"
    exit 1
}

hook_scripts_dir=$(cd "$(dirname "$0")"; pwd)
read -r -p "Enter a git repository dir>" git_repository_dir


# window path turn to linux path
if [[ $git_repository_dir == *:* ]]
then
	git_repository_dir=${git_repository_dir//\\/\/}
	git_repository_dir=${git_repository_dir/:/}
	git_repository_dir="/"${git_repository_dir}
fi

# check path exist
if [[ ! -d ${git_repository_dir} ]]
then
	fatal "\"${git_repository_dir}\" path is not found"
fi

cd ${git_repository_dir}

# check is a git repository
if [[ $(git rev-parse --is-inside-work-tree) != "true" ]]
then
	fatal "Not a git repository (or any of the parent directories): .git"
fi

# get the git work path
git_work_tree=$(git rev-parse --show-toplevel)

cd -

for hook in "$hook_scripts_dir"/hooks/*; do
    basename=${hook##*/}
    local_script="$git_work_tree/.git/hooks/$basename"
    if test -f "$local_script"; then
        info skip: $basename hook already exists
    else
        info installing hook at: $local_script
        ln -s "$hook" "$local_script"
    fi
done
info "Installation Complete !"
