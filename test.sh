#/bin/bash
#This script takes multiple comma separated IP as a Input and run parallel ssh (A.B.C.D,M.N.O.P) 
#Assumption that all the instances are using same key, ec2.pem
if [ $# -eq 0 ]
  then
    echo "No arguments supplied, please supply comma separated IPs for parallel ssh"
	exit 1
fi
Rm_hosts=`echo $@|tr -s "," " "`
 parallel-ssh -H "$Rm_hosts" -l ec2-user -x "-oStrictHostKeyChecking=no -i /home/ubuntu/.ssh/ec2.pem" -i "hostname"
