#!/usr/bin/env bash

ps -ef | grep example | grep -v grep | awk '{print $2}' | { read pid; gdbserver --attach :22244 $pid; }