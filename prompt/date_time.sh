#!/bin/bash
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

#Date and time
__prompt_date_time='[`date "+%m/%d/%y %l:%M:%S"`]'

