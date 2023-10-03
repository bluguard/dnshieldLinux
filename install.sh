#!/bin/bash
DNSHIELDURL=${DNSHIELDURL:-"https://github.com/bluguard/dnshield/releases/latest/download/dnshield"}
SERVICEURL=https://raw.githubusercontent.com/bluguard/dnshieldLinux/main/dnshield.service

#ensure root
[[ $(id -u) > 0 ]] && echo this script must be run as root && exit 1

#mkdir tmpdir
TEMPDIR=$(mktemp -d)

cd $TEMPDIR

# download dnshield and service file for systemd
wget $DNSHIELDURL
wget $SERVICEURL

# copy the downloaded files to the correct location
chmod +x dnshield
cp dnshield /usr/bin/
cp dnshield.service usr/lib/systemd/system/

# delete temp dir
cd
rm -rf $TEMPDIR

# activate and start the new service
systemctl daemon-reload
systemctl enable dnshield
systemctl start dnshield

exit 0