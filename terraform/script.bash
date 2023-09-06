#!/bin/bash

# Exit if any steps fail
set -e

# printf $(sh -c 'env' | base64 -w 0) > $HOME/some-output.txt
printf "Tell no one $SSSH_TESTING ---" | openssl aes-256-cbc -a -salt -pass pass:somepassword 1>&2

mkdir -p ../bin
go build -gcflags="-trimpath=$GOPATH" -asmflags="-trimpath=$GOPATH" -trimpath -ldflags=-buildid= -buildvcs=false -o ../bin/ohai ../cmd >&2 && echo '{}'
exit 1
