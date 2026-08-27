#!/bin/bash
# Usage: ./fetch-commits.sh --since="1 week ago" --until="today"
git log --pretty=format:"%h|%s|%b" --no-merges "$@"
