#!/usr/bin/env bash

export XSECURELOCK_SAVER="saver_swarm"
export XSECURELOCK_AUTH="$(which auth_x11)"
export XSECURELOCK_PASSWORD_PROMPT="default"
export XSECURELOCK_SHOW_DATETIME="1"
export XSECURELOCK_DATETIME_FORMAT="%A, %d %B %Y %H:%M:%S"
export XSECURELOCK_SHOW_KEYBOARD_LAYOUT="1"
export XSECURELOCK_SHOW_CAPS_LOCK="1"
export XSECURELOCK_BACKGROUND_IMAGE="/home/iershov/.config/hypr/desk.jpg"

xsecurelock