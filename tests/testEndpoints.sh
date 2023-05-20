#!/bin/bash

set -e

#get the csrf tokent
csrf_token=$(curl -c cookies.txt http://localhost/login | grep csrf_token | sed 's/.*value="\([^"]*\)".*/\1/')
 echo "$(curl -b cookies.txt -X POST -d "email=lhhung@uw.edu&password=qwerty&csrf_token=${csrf_token}" http://localhost/login)"

page_name=$(curl -b cookies.txt -X POST -d "email=lhhung@uw.edu&password=qwerty&csrf_token=${csrf_token}" http://localhost/login | sed -n 's:.*<title>\(.*\)<\/title>.*:\1:p')


if [ "$page_name" != "Redirecting..." ]; then
    echo "$page_name is not Redirecting..."
    echo "Login endpoint failed with correct credentials"
    exit 1
fi
