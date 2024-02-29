#!/bin/bash
#
# Re-Open KeePassXC Database
#
## - Requests password of a KeePassXC database from the system keyring and opens
##   it
## - Listens to DBUS LockedHint signals. Closes the database on lock, reopens it
##   on unlock
##
##
## Copyright (c) 2021 Innerlohninger Andreas. All rights reserved.
##
## This work is released under the terms of the MIT license.
## For a copy, see <https://opensource.org/licenses/MIT>
#
#
## Configuration ----------------------------------------------------------------
#
## Path to kdbx Database
KDBX='~/Keepass/Passwords.kdbx'

# Secret tool password entry of database
# might be added with "secret-tool store --label='{label}' {attribute} {value}"
SECTOOL_ATTRIBUTE='application'
SECTOOL_VALUE='keepassxc'


# Variables --------------------------------------------------------------------
PID="0"

# Script -----------------------------------------------------------------------

# Starts keepassxc and stores its PID, exits with error if already running
function unlock_database {
    if pidof "keepassxc" > /dev/null; then
        echo "Another instance of keepassxc is already running!"
        exit 1
    fi

    eval "secret-tool lookup $SECTOOL_ATTRIBUTE $SECTOOL_VALUE |
          /usr/bin/keepassxc --pw-stdin $KDBX &> /dev/null &"
    PID=$!
}

# Initial unlock
unlock_database

# Listen for LockedHint
gdbus monitor -y -d org.freedesktop.login1 |
  while read x; do
    case "$x" in
      *"boolean true"*) # Session locked, close database
                        kill $PID
                        ;;
      *"boolean false"*) # Session unlocked re-open database
                        unlock_database
                        ;;
    esac
  done
