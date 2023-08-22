#!/bin/bash

# Exit if any steps fail
set -e

mkdir -p ../bin
go build -gcflags="-trimpath=$GOPATH" -asmflags="-trimpath=$GOPATH" -trimpath -ldflags=-buildid= -buildvcs=false -o ../bin/ohai ../cmd >&2 && echo '{}'
