#!/bin/bash

set -e

PREFIX="/usr"

install -m 755 ./noobfetch.sh "${PREFIX}/bin/noobfetch"

exit 0
