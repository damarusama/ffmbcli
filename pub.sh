#!/bin/bash
###########################
# ffmbcli is a flat file micro blog cli too
# Author: gef
# Website: ponnuki.net
# Copyright: 2016

# Edit this part with your credential
# Make sure to copy your ssh key to help with the publication of your page

user="your_ssh_user"
server="your_ssh_server"
path="/your/server/path/" 

#Help function
function HELP {
  echo -e \\n"Help documentation for publishing to the flat file micro blog with  ${BOLD}Pub.${NORM}"\\n
  echo -e "${REV}Basic usage:${NORM} ${BOLD} pub -d "description" file.png${NORM}"\\n
  echo "The following switches are recognized."
  echo "${REV}-d${NORM} Input a description or a quote for the new post."
  echo -e "${REV}-h${NORM}  --Displays this help message. No further functions are performed."\\n
  echo -e "Example: ${BOLD} pub -d \"this is a descriptio\" image.jpg${NORM}"\\n
  exit 1
}

# Reading the variables from the command line

while getopts ":d:i:h" opt; do
  case $opt in
    d)
      echo "-a was triggered, Parameter: $OPTARG" >&2
	desc="$OPTARG"
      ;;
    i)
      echo "-i was triggered, Parameter: $OPTARG" >&2
	img="$OPTARG"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
    h) #Show help
	HELP
    ;;
  esac
done

while [ $# -ne 0 ]; do

# Get and Update the json file

scp $user@$server:$path/content.json .

sed '1d; $d' content.json > tmp
mv tmp  content.json

echo -e  ",{\"img\":\"$img\",\"desc\":\"$desc\"}\n]}" >> content.json

sed "1i{ \"posts\":[" content.json > tmp &&
  mv tmp content.json


# Send all to the server

scp $img content.json $user@$server:$path

#clean up the mess

rm content.json

echo "Website updated"
exit 0

done
HELP

exit 0

