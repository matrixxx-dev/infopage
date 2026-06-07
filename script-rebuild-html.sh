#!/bin/bash

## ########################################################################## ##
## rebuild html from markdown files
##
## ########################################################################## ##
FILE_ARRAY=(
"index.md"
"lang-de/blog.md"
"lang-de/datenschutz.md"
"lang-de/download.md"
"lang-de/impressum.md"
"lang-de/introduction.md"
"index_en.md"
"lang-en/blog.md"
"lang-en/datenschutz.md"
"lang-en/download.md"
"lang-en/impressum.md"
"lang-en/introduction.md"
)

## -------------------------------------------------------------------------- ##
## FUNCTIONS:
## -------------------------------------------------------------------------- ##
func_rebuild(){
  local  file
  for file in "${FILE_ARRAY[@]}"
  do
    func_gen_html_with_pandoc "${file}"
  done
}

func_gen_html_with_pandoc(){ # file="$1"
  local cmd file
  file="$1"

  if cmd=$(type -p pandoc-run.sh) && [ -x "${cmd}" ]; then
    [ -f "${file}" ] && ${cmd} "${file}" 2>/dev/null
  elif cmd=$(type -p pandoc) && [ -x "${cmd}" ]; then
    [ -f "${file}" ] \
      && ${cmd} -f markdown -t html5 "${file}" -o "${file}.html"
  fi
}

## -------------------------------------------------------------------------- ##
## MAIN:
## -------------------------------------------------------------------------- ##
func_rebuild

## -------------------------------------------------------------------------- ##
## pause:
echo "Press enter to continue..."; read -r

## ########################################################################## ##
exit 0
