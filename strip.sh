#!/usr/bin/sh
# This script will remove (comment) all occurences require_once in order to
# speed up things. Code is derived from the ZF performance guide.

find . -name '*.php' -not -wholename '*/Loader/Autoloader.php' -print0 | xargs -0 sed -E -i 's/(require_once)/\/\/ \1/g'
find . -name '*.php' -print0 | xargs -0 sed -i 's/[ ]*$//'
sed -E -i 's/\/\/ (require_once \$path)/\1/g' Application.php
