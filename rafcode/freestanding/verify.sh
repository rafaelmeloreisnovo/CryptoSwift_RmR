#!/bin/sh
set -eu
cd "$(dirname "$0")"
: "${TMPDIR:=/tmp}"
tmp=$(mktemp -d "${TMPDIR%/}/rafkey.XXXXXXXX")
trap 'rm -rf "$tmp"' EXIT HUP INT TERM
for cc in gcc clang; do
  command -v "$cc" >/dev/null 2>&1 || continue
  for opt in 0 2 s; do
    "$cc" -std=c11 -O"$opt" -ffreestanding -fno-builtin -fno-stack-protector -Wall -Wextra -Werror -pedantic -Iinclude -c src/raf_key_policy.c -o "$tmp/key.o"
    if nm -u "$tmp/key.o" | grep .; then
      echo "FAIL: unresolved core symbols ($cc -O$opt)" >&2; exit 1
    fi
    "$cc" -std=c11 -O"$opt" -Wall -Wextra -Werror -pedantic -Iinclude tests/test_key_policy.c "$tmp/key.o" -o "$tmp/test"
    "$tmp/test"
    echo "PASS scoped policy $cc -O$opt"
  done
done
