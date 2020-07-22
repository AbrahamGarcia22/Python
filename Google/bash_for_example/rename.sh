#!/bin/bash

### Here we are using this for loop in order to rename HTM files with html extension ###

for file in *.HTM; do
    name=$(basename "$file" .HTM)
    mv "$file" "$name.html"
done