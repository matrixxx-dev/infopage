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

DEFAULT_YAML_NAME="github-markdown"

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

  [ -z "${config_name}" ] && config_name="${DEFAULT_YAML_NAME}"

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
  if [ "${default_file}" = "${DEFAULT_YAML_NAME}.yaml" ]; then
    pandoc \
    --data-dir="${DATA_DIR}" \
    --defaults="${default_file}" \
    -f markdown -t html5 "${md_file}" | func_stdin_to_www
    #echo '<h1>hello, world</h1>' | firefox "data:text/html;base64,$(base64 -w 0 <&0)"
    #cat | firefox -new-instance /dev/fd/0
  else
    pandoc \
    --data-dir="${DATA_DIR}" \
    --defaults="${default_file}" \
    -f markdown -t html5 "${md_file}" -o "${output_file}"
  fi
}

## -------------------------------------------------------------------------- ##
## read from stdin, write to a temp file, open the temp file in a browser
## finally delete the temp file
func_stdin_to_www(){
  local tmpfile
  #tmpfile=$(mktemp -q)
  tmpfile="./temp.html"
  cat > "${tmpfile}"
  x-www-browser -new-instance "${tmpfile}" && rm -f "${tmpfile}"
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
