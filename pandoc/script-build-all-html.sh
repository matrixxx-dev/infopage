#!/bin/bash

## ########################################################################## ##
## build-all-html
##
## ########################################################################## ##

## -------------------------------------------------------------------------- ##
## FUNCTIONS:
## -------------------------------------------------------------------------- ##
func_check_on_website(){ # md_file="$1"
  local md_file search_pattern line config_name
  md_file="$1"

  ## evaluation of the meta data block of the markdown file
  search_pattern="defaults:"
  while read -r line
  do
    if [ "${line:0:9}" = "${search_pattern}" ]; then
      config_name="${line:10}"
      break
    fi
  done < "${md_file}"

  [ "${config_name}" = "website" ] && return 0
  [ "${config_name}" = "website-index" ]  && return 0
  return 1
}

func_process(){
  local md_file

  for md_file in *.md
  do
    echo "## ---------------------------------------- ##"
    echo "markdown file: ${md_file}"
    if func_check_on_website "${md_file}" ;then
      echo "- is a website"
      ./pandoc/pandoc-run.sh "${md_file}"
    fi
  done
}

## -------------------------------------------------------------------------- ##
## MAIN:
## -------------------------------------------------------------------------- ##
cd ..
func_process

## -------------------------------------------------------------------------- ##
## Pause:
echo "Press enter to continue..."; read -r

## ########################################################################## ##
exit 0
