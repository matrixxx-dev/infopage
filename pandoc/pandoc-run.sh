#!/bin/bash

## ########################################################################## ##
## pandoc starter
##  - evaluation of the meta data block of the markdown file
##    - search pattern: 'defaults:' - yaml file without ext.
##  - call pandoc
##
## ########################################################################## ##
## Integration in geany:
## -> Erstellen -> Kommandos zu Erstellen konfigurieren -> pandoc-run script
## ändern von pandoc-run.sh "%f" nach ./pandoc/pandoc-run.sh "%f"
##
## ########################################################################## ##
FILE_MD="$1"
DEFAULT_YAML_NAME="github-markdown"
DATA_DIR="$2"

## -------------------------------------------------------------------------- ##
## FUNCTIONS:
## -------------------------------------------------------------------------- ##
. pandoc-handling

## -------------------------------------------------------------------------- ##
## MAIN:
## -------------------------------------------------------------------------- ##
[ -f "${FILE_MD}" ] || {
  read -rp "${FILE_MD} (md file) does not exist !!!"; exit 1
}

func_process "${FILE_MD}" "${DEFAULT_YAML_NAME}" "${DATA_DIR}"


## ########################################################################## ##
exit 0
