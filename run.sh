#!/bin/sh
#
# Wrapper script for running various project related commands.

# Go to this project root.
cd $(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)

usage=$(cat << HELP
\e[32mThe run script.\e[0m

A helper wrapper for running common commands in ubiqutous way on *nix systems.

\e[33mSYNOPSIS:\e[0m
  run [<options>] <command> [<arguments...>]

\e[33mOPTIONS:\e[0m
  -h, --help      Display this help.

\e[33mCOMMANDS:\e[0m
  build    Build Docker image.
           Synopsis:
             run build
HELP
)

while test $# -gt 0; do
  if test "$1" = "-h" || test "$1" = "--help"; then
    echo "$usage"
    exit 0
  else
    command=$1

    # First argument after command.
    if test "$2"; then
      shift
      argument_1=$1
    fi

    # Second argument after command.
    if test "$2"; then
      shift
      argument_2=$1
    fi

    # Third argument (and the rest) after command.
    if test "$2"; then
      shift
      argument_3=$@
    fi
  fi

  shift
done

case "$command" in
  build)
    docker build --pull --no-cache -t drupal-check -f Dockerfile .

    ;;
  *)
    echo "$usage"
esac
