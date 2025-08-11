#!/bin/bash

set -e

WORKDIR=$(pwd)

usage() {
  echo "Usage:"
  echo "  $0 terraform [terraform-args]"
  echo "  $0 ansible [ansible-args]"
  echo ""
  echo "Examples:"
  echo "  $0 terraform plan"
  echo "  $0 terraform apply -auto-approve"
  echo "  $0 ansible --version"
  echo "  $0 ansible-playbook playbook.yml"
  exit 1
}

if [ $# -lt 1 ]; then
  usage
fi

CMD=$1
shift

case "$CMD" in
  terraform)
    docker run --rm -it \
      -v "$WORKDIR":/workspace \
      -w /workspace \
      harbor.mgmtdwr.rijksoverheid.nl/library/hashicorp/terraform:1.12 \
      "$@"
    ;;
  ansible)
    docker run --rm -it \
      -v "$WORKDIR":/workspace \
      -w /workspace \
      alpine/ansible:2.18.6 \
      ansible "$@"
    ;;
  *)
    echo "Invalid command: $CMD"
    usage
    ;;
esac
