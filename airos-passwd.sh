# !/bin/bash
## Change password for Ubiquiti Devices
#
# current user
USER="ubnt"
# current password
PWD="ubnt"
# new crypt password
NEW_PWD="'$'1'$'s7GvR1J6'$'NDYV448oRpT5gVnTV5eO8."
# remove all users created on device
sed -i "/users./d" /tmp/system.cfg
# add new user and password crypted
echo users.status=enabled >> /tmp/system.cfg
echo users.1.status=enabled >> /tmp/system.cfg
echo users.1.password=$NEW_PWD >> /tmp/system.cfg
echo users.1.name=compunet >> /tmp/system.cfg
# save all changes and roboot the device
cfgmtd -w -p /etc
reboot
