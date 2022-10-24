#!/bin/bash

apk add gcompat libstdc++6 libuser bash

target_file=/etc/ssh/sshd_config

sed -i 's/AllowTcpForwarding no/AllowTcpForwarding yes/g' $target_file
sed -i 's/#PermitTunnel no/PermitTunnel yes/g' $target_file

service sshd restart