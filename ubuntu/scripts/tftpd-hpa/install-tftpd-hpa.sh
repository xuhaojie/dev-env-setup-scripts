#!/bin/bash
sudo apt update
sudo apt install -y tftpd-hpa 
sudo mkdir /tftp
sudo chmod 775 /tftp

target_file=/etc/default/tftpd-hpa
backup_file=$target_file.bak

if [ -f $backup_file ]; then 
	rm $backup_file
fi

mv $target_file $backup_file


##  /etc/default/tftpd-hpa
#
# TFTP_USERNAME="tftp"
# TFTP_DIRECTORY="/tftp"
# TFTP_ADDRESS=":69"
# TFTP_OPTIONS="--create  --secure"


echo -e "# /etc/default/tftpd-hpa" | tee -a $target_file
echo -e " " | tee -a $target_file
echo -e "TFTP_USERNAME=\"tftp\"" | tee -a $target_file
echo -e "TFTP_DIRECTORY=\"/tftp\"" | tee -a $target_file
echo -e "TFTP_ADDRESS=\":69\"" | tee -a $target_file
echo -e "TFTP_OPTIONS=\"--create  --secure\"" | tee -a $target_file

sudo service tftpd-hpa start