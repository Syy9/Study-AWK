#!/bin/bash

echo "Hello, world" # Hello, world

echo "foo" | awk '0' # non

echo "foo" | awk '1' # foo

echo "foo" | awk 'A' # foo

echo "foo" | awk '0""' # foo

echo "foo" | awk '$0 == "foo"' # foo

echo "foo" | awk '{print $0 == "foo"}' # syntax error

echo "foo" | awk '{print ($0 == "foo")}' # 1
