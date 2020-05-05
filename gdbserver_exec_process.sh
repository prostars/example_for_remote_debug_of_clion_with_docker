#!/usr/bin/env bash

docker exec centos_7 /bin/bash -c "gdbserver :22244 /tmp/example/cmake-build-debug-remote-host/example"