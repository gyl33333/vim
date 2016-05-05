#!/bin/bash
#[ "`whoami`" = root ] || exec sudo "$0" "$@"
com() {
	if [  ! -d ~/log/minicom_log/ ]; then
		echo there is no log derectery, please input this command
		echo "mkdir ~/log/minicom_log/"
		mkdir -p ~/log/minicom_log/
	fi
	today_dir=`LCALL=C date +%F`
	if [  ! -d ~/log/minicom_log/$today_dir ]; then
		echo auto midir ~/log/minicom_log/$today_dir
		mkdir ~/log/minicom_log/$today_dir
	fi
	#if [  -z ~/.data_my_passwd ]; then
	#	echo there is no passwd file, please input the passwd to ~/.data_my_passwd
	#	exit 1
	#fi
	#cat ~/.data_my_passwd | sudo -S ls > /dev/null

	logname=$today_dir/`LCALL=C date +%H%M%S`
	#echo param=$#
	if [ $# != 0 ]; then
		sudo minicom -w $@
	else
		sudo minicom -w -C ~/log/minicom_log/${logname}.log
	fi
}
