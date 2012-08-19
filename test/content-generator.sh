#!/bin/bash
#
# sample content generator executable for atftp tests
#

if [ $# -ne 2 ]; then
	echo "number of parameters incorrect: is $# need 2"
	exit 1
fi
if [ "$1" != "--file" ]; then
	echo "second parameter wrong, expected \"--file\""
	exit 1
fi
FILE="$(basename $2)"

# make sure that this content generator script only acts on specific filenames
case "$FILE" in
	generate-*)
		;;
	*)
		exit 1
		;;
esac


# how to write to a specific filedescriptor?
#
# either line by line
echo "hello world" >&3
echo "this is a generated dummy file with the virtual filename \"$FILE\"" >&3

# or by maping filedescriptor 1 to fd 3
exec 1>&3
echo "hello world"
echo "this is a generated dummy file with the virtual filename \"$FILE\""

exit 0
