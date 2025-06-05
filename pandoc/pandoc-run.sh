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
DATA_DIR="pandoc"
HTML_ONLY="true"

## -------------------------------------------------------------------------- ##
## FUNCTIONS:
## -------------------------------------------------------------------------- ##
func_process(){ # md_file="$1"
  local md_file config_name search_pattern line default_file
  md_file="$1"
  config_name=""

  ## evaluation of the meta data block of the markdown file
  #echo "file: ${md_file}"
  search_pattern="defaults:"
  while read -r line
  do
    if [ "${line:0:9}" = "${search_pattern}" ]; then
      config_name="${line:10}"
      break
    fi
  done < "${md_file}"

  [ -z "${config_name}" ] && config_name="standard"

  ## check if default file exists ...
  ## - yes: call pandoc
  ## - no:  error and exit
  default_file="${config_name}.yaml"
  #echo "default file: ${default_file}"
  #echo "default file: ${DATA_DIR}/defaults/${default_file}"
  if [ -f "${default_file}" ] \
  || [ -f "${DATA_DIR}"/defaults/"${default_file}" ]
  then
    echo "use ${default_file} as config:"
    func_run_pandoc "${md_file}" "${default_file}"
  else
    echo "${default_file} does not exist !!!"
    read -r
    exit 1
  fi
}

## -------------------------------------------------------------------------- ##
func_run_pandoc(){ # md_file="$1"; default_file="$2"
  local md_file default_file output_file
  md_file="$1"; default_file="$2"

  if [ "${HTML_ONLY}" = "true" ]; then
    output_file="${md_file//.md*/}.html"
  else
    output_file="${md_file}.html"
  fi

  rm -f "${output_file}"

  ## pandoc
  ##   --data-dir=DIRECTORY   Specify the user data directory to search
  ##                          for pandoc data files. Overwrites default
  ##                          data file directory: $XDG_DATA_HOME/pandoc.
  ##                          set ${USERDATA}
  ##   --defaults=FILE        Specify a set of default option settings
  ##                          (search in [data-dir]/defaults)
  pandoc \
  --data-dir="${DATA_DIR}" \
  --defaults="${default_file}" \
  -f markdown -t html5 "${md_file}" -o "${output_file}"
}

## -------------------------------------------------------------------------- ##
## MAIN:
## -------------------------------------------------------------------------- ##
[ -f "${FILE_MD}" ] || {
  read -rp "${FILE_MD} (md file) does not exist !!!"; exit 1
}

func_process "${FILE_MD}"


## ########################################################################## ##
exit 0
