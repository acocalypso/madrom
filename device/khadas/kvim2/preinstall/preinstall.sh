#!/system/bin/sh

MARK=/data/local/symbol_thirdpart_apks_installed
PKGS=/system/preinstall/

if [ ! -e $MARK ]; then
echo "booting the first time, so pre-install some APKs."

busybox find $PKGS -name "*\.apk" -exec sh /system/bin/pm install {} \;

# NO NEED to delete these APKs since we keep a mark under data partition.
# And the mark will be wiped out after doing factory reset, so you can install
# these APKs again if files are still there.

touch $MARK
echo "OK, installation complete."
fi

## add init.d support
export PATH=${PATH}:/system/bin:/system/xbin
IMARK=/data/local/initd_permission_fixed

if [ ! -e $IMARK ]; then
echo "booting the first time, fix init.d permission."

mount -o remount,rw -t auto /system
chmod -R 755 /system/etc/init.d
mount -o remount,ro -t auto /system

touch $IMARK
fi

## init.d execution hook
logwrapper busybox run-parts /system/etc/init.d/
