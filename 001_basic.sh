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

echo "■■■■■■■■■■■■■■■■■■■■■■■■■■"
echo "■■■■■■■■■■■■■■■■■■■■■■■■■■"
echo "■■■■■■■■■■■■■■■■■■■■■■■■■■"

seq 1 3
# 1
# 2
# 3

seq 1 3 | awk 'NR == 1 {print $0}' # 1
seq 1 3 | awk 'NR == 1' # 1
seq 1 3 | awk 'NR <= 2'
# 1
# 2

seq 1 5 | awk 'NR >= 2 && NR <= 4'
# 2
# 3
# 4

seq 1 5 | awk 'NR == 2, NR == 4'
# 2
# 3
# 4

echo "■■■■■■■■■■■■■■■■■■■■■■■■■■"
echo "■■■■■■■■■■■■■■■■■■■■■■■■■■"
echo "■■■■■■■■■■■■■■■■■■■■■■■■■■"

seq 1 10 | awk 'NR % 2 == 0, NR %3 == 0'
# 2
# 3
# 4
# 5
# 6
# 8
# 9
# 10

seq 1 3 | awk '/1/' # 1

seq 1 3 | awk '$0 ~ /1/' # 1

seq 1 3 | awk '!/1/'
# 2
# 3

seq 1 3 | awk '$0 !~ /1/'
# 2
# 3

seq 1 3 | awk '/[12]/'
# 2
# 3

ps ax | grep 'awk' | grep -v 'grep' | awk '{print $1}' # some psid

ps ax | awk '/[a]wk/ {print $1}' # some psid

echo "This is a pen" | awk '{print $0}' # This is a pen
echo "This is a pen" | awk '{print $1}' # This
echo "This is a pen" | awk '{print $2}' # is
echo "This is a pen" | awk '{print $3}' # a
echo "This is a pen" | awk '{print $4}' # pen
echo "This is a pen" | awk '{print $NF}' # pen
echo "This is a pen" | awk '{print $(NF-1)}' # a
echo "This is a pen" | awk '{print $(NF-2)}' # is
echo "This is a pen" | awk '{print $(NF-3)}' # This

echo "a,b,c" | awk -F',' '{print $2}' # b

echo "a b c" | awk '{$2 = ""; print}' # a  c
echo "a b c" | awk '!($2 = "")' # a  c
echo "a b c" | awk '{print $1, $3}' # a c

