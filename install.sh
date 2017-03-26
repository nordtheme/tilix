#!/usr/bin/env bash
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# title      Install Script                                +
# project    nord-tilix                                    +
# repository https://github.com/arcticicestudio/nord-tilix +
# author     Arctic Ice Studio                             +
# email      development@arcticicestudio.com               +
# copyright  Copyright (C) 2017                            +
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
set -e

_ct_error="\e[0;31m"
_ct_success="\e[0;32m"
_ct_warning="\e[0;33m"
_ct_highlight="\e[0;34m"
_ct_primary="\e[0;36m"
_ct="\e[0;37m"
_ctb_subtle="\e[1;30m"
_ctb_error="\e[1;31m"
_ctb_success="\e[1;32m"
_ctb_warning="\e[1;33m"
_ctb_highlight="\e[1;34m"
_ctb_primary="\e[1;36m"
_ctb="\e[1;37m"
_c_reset="\e[0m"

__help() {
  printf "${_ctb}Usage: ${_ct_primary}install.sh ${_ctb_subtle}[OPTIONS]\n"
  printf "  ${_ctb_highlight}-h${_ct},${_ctb_highlight} --help                      ${_ct}Help\n"
  printf "  ${_ctb_highlight}-v${_ct},${_ctb_highlight} --verbose                   ${_ct}Verbose output\n${_ctb_reset}"
  printf "  ${_ctb_highlight}-g${_ct},${_ctb_highlight} --global                    \
${_ct}Install global\n${_ctb_reset}"
  printf "  ${_ctb_highlight}-s${_ct},${_ctb_highlight} --schemefile <SCHEME_FILE>  \
${_ct}Use the specified scheme file\n${_ctb_reset}"
}

__cleanup() {
  trap '' SIGINT SIGTERM
  unset -v _ct_error _ct_success _ct_warning _ct_highlight _ct_primary _ct
  unset -v _ctb_error _ctb_success _ctb_warning _ctb_highlight _ctb_primary _ctb _c_reset
  unset -v NORD_TILIX_SCRIPT_OPTS COLOR_SCHEME_FILE VERBOSE GLOBAL_INSTALL LOCAL_INSTALL
  unset -f __help __cleanup __log_error __log_success __log_warning __log_info
  unset -f __validate_file __local_install __global_install
}

__log_error() {
  printf "${_ctb_error}[ERROR] ${_ct}$1${_c_reset}\n"
}

__log_success() {
  printf "${_ctb_success}[OK] ${_ct}$1${_c_reset}\n"
}

__log_warning() {
  printf "${_ctb_warning}[WARN] ${_ct}$1${_c_reset}\n"
}

__log_info() {
  printf "${_ctb}[INFO] ${_ct}$1${_c_reset}\n"
}

__summary_success() {
  if [ $GLOBAL_INSTALL = true ]; then
    __log_success "Global installation completed"
  else
    __log_success "Local installation completed"
  fi
  __cleanup
  exit 0
}

__summary_error() {
  __log_error "An error occurred during the installation!"
  __log_error "Exit code: $1"
  __cleanup
  exit 1
}

__global_install() {
  __validate_file
  if [ ! -d $GLOBAL_INSTALL_DIR ]; then
    sudo mkdir -p $GLOBAL_INSTALL_DIR
    if [ $? -eq 0 ]; then
      if [ $VERBOSE = true ]; then __log_info "Created global directory $GLOBAL_INSTALL_DIR"; fi
    else
      __log_error "Could not create global directory $GLOBAL_INSTALL_DIR"
      __summary_error 1
    fi
  fi
  sudo cp -f $COLOR_SCHEME_FILE $GLOBAL_INSTALL_DIR
  if [ $? -eq 0 ]; then
    if [ $VERBOSE = true ]; then __log_success "Copied color scheme file to $GLOBAL_INSTALL_DIR"; fi
    __summary_success
  else
    __log_error "Could not copy color scheme file to $GLOBAL_INSTALL_DIR"
    __summary_error 1
  fi
}

__local_install() {
  __validate_file
  if [ ! -d $LOCAL_INSTALL_DIR ]; then
    mkdir -p $LOCAL_INSTALL_DIR
    if [ $? -eq 0 ]; then
      if [ $VERBOSE = true ]; then __log_info "Created local directory $LOCAL_INSTALL_DIR"; fi
    else
      __log_error "Could not create local directory $LOCAL_INSTALL_DIR"
      __summary_error 1
    fi
  fi
  cp -f $COLOR_SCHEME_FILE $LOCAL_INSTALL_DIR
  if [ $? -eq 0 ]; then
    if [ $VERBOSE = true ]; then __log_success "Copied color scheme file to $LOCAL_INSTALL_DIR"; fi
    __summary_success
  else
    __log_error "Could not copy color scheme file to $LOCAL_INSTALL_DIR"
    __summary_error 1
  fi
}

__validate_file() {
  if [ ! -f $COLOR_SCHEME_FILE ]; then
    __log_error "Color scheme file not found: $COLOR_SCHEME_FILE"
    __summary_error 1
  fi
}

trap "printf '${_ctb_error}User aborted.${_ctb_reset}\n' && exit 1" SIGINT SIGTERM

NORD_TILIX_SCRIPT_OPTS=`getopt -o vghs: --long verbose,global,help,schemefile: -n 'install.sh' -- "$@"`
COLOR_SCHEME_FILE=src/json/nord.json
VERBOSE=false
GLOBAL_INSTALL=false
LOCAL_INSTALL_DIR=~/.config/tilix/schemes
GLOBAL_INSTALL_DIR=/usr/share/tilix/schemes

eval set -- "$NORD_TILIX_SCRIPT_OPTS"
while true; do
  case "$1" in
    -v | --verbose ) VERBOSE=true; shift ;;
    -g | --global ) GLOBAL_INSTALL=true; shift ;;
    -h | --help ) __help; exit 0; break ;;
    -s | --schemefile )
      COLOR_SCHEME_FILE="$2"; shift 2 ;;
    -- ) shift; break ;;
    * ) break ;;
  esac
done

if [ $GLOBAL_INSTALL = true ]; then
  __global_install
else
  __local_install
fi

__cleanup
exit 0
