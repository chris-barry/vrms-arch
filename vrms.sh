#!/bin/sh

# VRMS: Arch Style
#
# https://github.com/chris-barry/vrms-arch
#
# Find non-free packages installed with Arch Linux

BAD="https://projects.parabolagnulinux.org/blacklist.git/plain/blacklist.txt";
INSTALLED=$(mktemp);
BLACKLIST=$(mktemp);

pacman -Q > $INSTALLED;

curl --silent $BAD | awk -F: '{ print $1 }' > $BLACKLIST;

cat $BLACKLIST | while read I
do
	grep $I $INSTALLED;
done

rm $INSTALLED $BLACKLIST;

exit;
