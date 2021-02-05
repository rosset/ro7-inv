#!/bin/bash
# clean results
rm ./result.txt

# variable def for sum
total_wls=0
total_oem=0
total_nm=0

for i in $(cat list1.txt);
        do
		    #WLS - detect how many proccess, write to log and sum to total_wls
            OS_VER=$( SSHPASS=$PASS ./sshpass -e  ssh -o StrictHostKeyChecking=no -o NumberOfPasswordPrompts=1 root@$i " echo 'WebLogic' ; ps aux | grep -i java  | grep weblogic.Server | grep -v grep | wc -l ; " ) 2>/dev/null
            echo $i $OS_VER >> ./result.txt
            WLS1=$( SSHPASS=$PASS ./sshpass -e  ssh -o StrictHostKeyChecking=no -o NumberOfPasswordPrompts=1 root@$i "ps aux | grep -i java  | grep weblogic.Server | grep -v grep | wc -l" ) 2>/dev/null
            total_wls=$(($total_wls + $WLS1))
            
			#OEM
			OS_VER=$( SSHPASS=$PASS ./sshpass -e  ssh -o StrictHostKeyChecking=no -o NumberOfPasswordPrompts=1 root@$i " echo 'OEM agent' ; ps aux | grep -i java  | egrep agent | egrep gcagent | grep -v grep | wc -l" ) 2>/dev/null
            echo $i $OS_VER >> ./result.txt
            OEM1=$( SSHPASS=$PASS ./sshpass -e  ssh -o StrictHostKeyChecking=no -o NumberOfPasswordPrompts=1 root@$i "ps aux | grep -i java  | egrep agent | egrep gcagent | grep -v grep | wc -l" ) 2>/dev/null
            total_oem=$(($total_oem + $OEM1))
			
			#NM
            OS_VER=$( SSHPASS=$PASS ./sshpass -e  ssh -o StrictHostKeyChecking=no -o NumberOfPasswordPrompts=1 root@$i " echo 'NodeManager ' ; ps aux | grep -i java  | grep weblogic.NodeManager | grep -v grep | wc -l" ) 2>/dev/null
			echo $i $OS_VER >> ./result.txt
            NM1=$( SSHPASS=$PASS ./sshpass -e  ssh -o StrictHostKeyChecking=no -o NumberOfPasswordPrompts=1 root@$i "ps aux | grep -i java  | grep weblogic.NodeManager | grep -v grep | wc -l" ) 2>/dev/null
            total_nm=$(($total_nm + $NM1))
done

# print to the screen
echo "Total WebLogic Server " $total_wls
echo "Total OEM agent " $total_oem
echo "Total NodeManager " $total_nm

cat ./result.txt

# WLS
# "ps aux | grep -i java  | grep weblogic.Server | grep -v grep | wc -l"
# OEM
# "ps aux | grep -i java  | egrep agent | egrep gcagent | grep -v grep | wc -l"
# NM
# "ps aux | grep -i java  | grep weblogic.NodeManager | grep -v grep | wc -l"
