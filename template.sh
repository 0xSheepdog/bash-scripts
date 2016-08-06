#!/bin/bash
#
# script template
# Jeff Pettorino
# 2016-07-29
#
# History:
#
#                                      4                                       8
#2345678901234567890123456789012345678901234567890123456789012345678901234567890

# -- Variable Definition
#    -- Template default variables
  readonly job=$(/usr/bin/basename "${0}")
  readonly lockdir="/var/run/${job}"
  readonly pidfile="${lockdir}/${BASHPID}.pid"
#
#    -- Script specific Global Variables

# -- End of Variable Definitions

# -- Function Definition
#    -- Template default functions (will source in the future)

# -- function gotroot | simple, elegant check for root/superuser status.
# --                  | unfortunately, this doesn't work with 'set -e'
gotroot() {
  return "$(id -u)"
}

# -- function runlock | check for and create lockdir before running
runlock() {
  mkdir "${lockdir}"
  return "${?}"
}


