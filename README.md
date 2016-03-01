# ffmbcli
Flat File Micro Blog CLI

This is a work in progress for my personal use to create a simple way to post online images and quotes. 

ffmbcli is a flat file micro blog system that can be edited only with the command line. It consist of a json content file, with a index.html that gets populated from that file, and a script file to post to your blog. 

## Installation

 - Copy the index.html file to your site
 - Edit the style as you want in the header of that index file
 - Copy the content.json to your site
 - Copy the pub.sh file on your computer
 - Edit the pub.sh file with your user/server/home directory
 - chmod +x pub.sh and you can copy it in your path to keep the workflow simple
 - Profit!


## How to use

In order to publish to your site:

``` ./pub.sh -d "Give a description" img.png ```

This will send your image and decription to your micro blog online

## Todo

 - Probably make more sense to use node
 - Bash script is error prone and not well coded
 - Need to verify dependency trough the script
 - Installation script? (Would install the index.html and content.json to remote)
