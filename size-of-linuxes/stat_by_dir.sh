#!/bin/sh

DIR=${DIR:-"
 include         \
 kernel          \
 mm              \
 crypto          \
 scripts         \
 security        \
 tools           \
 lib             \
 block           \
 Documentation   \
 ipc             \
 virt            \
 init            \
 firmware        \
 samples         \
 usr
"}

RANK=${RANK:-8}
NUM=${NUM:-2}

#
# drivers         \
# arch            \
# fs              \
# sound           \
# net             \
#

for d in $DIR; do

 echo "    $d"
 ./get_stat_of $d | grep "2\.6" | sed "s|^2\.6\.\([^;]*\) ;[^=]*=\([0-9]*\).*$|\1  \2|" | grep -v "^x" | sort -g | tail -$RANK | head -$NUM;

done

