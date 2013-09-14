#!/bin/sh

# VRMS: Arch Style
#
# https://github.com/chris-barry/vrms-arch
#
# Find non-free packages installed with Arch Linux

BAD="https://projects.parabolagnulinux.org/blacklist.git/plain/blacklist.txt";
INSTALLED=$(mktemp);
BLACKLIST=$(mktemp);

pacman -Qq > $INSTALLED;

curl --silent $BAD | awk -F: '{ print $1 }' > $BLACKLIST;

cat $BLACKLIST | while read I
do
	grep -Fx --color=auto $I $INSTALLED;
done

rm $INSTALLED $BLACKLIST;

exit;
