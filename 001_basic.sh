#!/bin/bash

echo "Hello, world" # Hello, world

echo "foo" | awk '0' # non

echo "foo" | awk '1' # foo

echo "foo" | awk 'A' # foo

echo "foo" | awk '0""' # foo

echo "foo" | awk '$0 == "foo"' # foo

echo "foo" | awk '{print $0 == "foo"}' # syntax error

echo "foo" | awk '{print ($0 == "foo")}' # 1

echo "foo" | awk '$0 ~ /foo/' # foo

echo "foo" | awk '/foo/' # foo

echo "foo" | awk '{print /foo/}' # 1

echo "foo" | awk '{print !(/foo/)}' # 0

echo "foo" | awk '{print !/foo/}' # 0

echo "a b c" | awk '{$2 = "B"; print $0}' # a B c

echo "a b c "| awk 'length' # a b c

echo "a b c" | awk '{print gsub(/a/, "")}' # 1

echo "a b c" | awk '{print gsub(/d/, "")}' # 0

echo "a b c" | awk '$0 = gsub(/a/, "")' # 1

echo "a b c" | awk '$0 = gsub(/d/, "")' # non

echo "a b c" | awk '$0 = gsub(/d/, "")""' # 0
