#!/bin/bash
#
# RHEL7.1 "sterilization" script
# Preps a system for deployment as a template VM by purging all logs, etc.
#
# by Jeff Pettorino
# v0.2
#

# Check for superuser privileges
if (( $UID != 0 )); then
    /bin/printf >&2 "You must be the superuser to run this script; giving up.\n"
    exit 1
fi

# Announce our intentions and provide current timestamp
/bin/printf >&2 'Virtual guest sanitization script initiated at '; /bin/date

# Stop rsyslog && auditd
# Using legacy /usr/bin/service command because of systemctl issues with auditd
/sbin/service rsyslog stop && /bin/printf >&2 "...rsyslog service stopped!\n"
/sbin/service auditd stop && /bin/printf >&2 "...auditd service stopped!\n"


# Execute logrotate
/sbin/logrotate -f /etc/logrotate.conf && /bin/printf >&2 "...syslog files rotated!\n"


# Deprecated! Don't do this unless you want to manage .ssh/known_hosts all the time!
# Remove existing SSH key pairs
#/bin/rm -f /etc/ssh/ssh_host_*_key && /bin/printf >&2 "...ssh host private keys purged!\n"
#/bin/rm -f /etc/ssh/ssh_host_*_key.pub && /bin/printf >&2 "...ssh host public keys purged!\n"


# Cleanup /var/log and remove non-essentials
/bin/rm -f /var/log/*-???????? /var/log/*.gz && /bin/printf >&2 "...rotated logs removed!\n"
/bin/rm -f /var/log/dmesg.old && /bin/printf >&2 "...dmesg.old deleted!\n"
/bin/rm -rf /var/log/anaconda && /bin/printf >&2 "...anaconda build logs eradicated!\n"


# Truncate existing logfiles
/bin/printf "About to truncate all log files...\n"
/bin/cat /dev/null > /var/log/audit/audit.log && /bin/printf >&2 "...audit.log - check\n"
/bin/cat /dev/null > /var/log/boot.log && /bin/printf >&2 "...boot.log - check\n"
/bin/cat /dev/null > /var/log/btmp && /bin/printf >&2 "...btmp - check\n"
/bin/cat /dev/null > /var/log/cron && /bin/printf >&2 "...cron - check\n"
/bin/cat /dev/null > /var/log/dmesg && /bin/printf >&2 "...dmesg - check\n"
/bin/cat /dev/null > /var/log/lastlog && /bin/printf >&2 "...lastlog - check\n"
/bin/cat /dev/null > /var/log/maillog && /bin/printf >&2 "...maillog - check\n"
/bin/cat /dev/null > /var/log/messages && /bin/printf >&2 "...messages - check\n"
/bin/cat /dev/null > /var/log/secure && /bin/printf >&2 "...secure - check\n"
/bin/cat /dev/null > /var/log/spooler && /bin/printf >&2 "...spooler - check\n"
/bin/cat /dev/null > /var/log/tallylog && /bin/printf >&2 "...tallylog - check\n"
/bin/cat /dev/null > /var/log/wtmp && /bin/printf >&2 "...wtmp - check\n"
#/bin/cat /dev/null > /var/log/yum.log && /bin/printf >&2 "...yum.log - check\n"

