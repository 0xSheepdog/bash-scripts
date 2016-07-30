#!/bin/bash
#
# script template
# Jeff Pettorino
# 2016-07-29
#
# History:
#
#
#

# -- Variable Definition
  readonly job=$(/usr/bin/basename "${0}")
  readonly lockdir="/var/run/${job}"
  readonly pidfile="${lockdir}/${BASHPID}.pid"

