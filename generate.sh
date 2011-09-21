#!/bin/bash

XSD_PATH="drop-xsd-here/*.xsd"

for f in $XSD_PATH; do
    # Remove spaces from file name
    file=$(echo $f | tr A-Z a-z | tr ' ' _)
    [ ! -f $file ] && mv "$f" $file

    b=$(basename $file)
    fn="${b%.*}"
    xsltproc xs3p.xsl $file > generated-docs/$fn.html
done;

