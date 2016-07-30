#!/bin/bash
#
# by Jeff Pettorino
#
#2345678901234567890123456789012345678901234567890123456789012345678901234567890

# Function: 'gotroot' returns the UID as a status code. Since the UID of root
#           is 0, and true == 0,  the function returns 'true' if the UserID
#           is 0 (meaning it is roots userid).
gotroot() {
  return "$(id -u)"
}

# Function: 'runlock' checks for a lockdir under /var/run, creates it if absent,
#           and create Process ID file within. It also set's the trap signal to
#           remove the lockdir when finished with a status code of 0.
runlock() {
  mkdir "${lockdir}"
  trap "rm -rf ${lockdir}" exit
  return "${?}"
}




