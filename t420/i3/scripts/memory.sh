#!/bin/sh
# FreeBSD has no `free` -- derive used/total from sysctl instead.
total=$(sysctl -n hw.physmem)
pagesize=$(sysctl -n hw.pagesize)
free_pages=$(sysctl -n vm.stats.vm.v_free_count)
free=$((free_pages * pagesize))
used=$(((total - free) / 1024 / 1024))
totalmb=$((total / 1024 / 1024))
printf '%dM/%dM\n' "$used" "$totalmb"
