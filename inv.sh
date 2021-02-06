#!/bin/bash
# clean results
result="./output-ENV.txt"

# variable def for sum
total_wls=0
total_oem=0
total_nm=0
total_odi=0
total_soa=0
total_oam=0
total_oim=0
total_oid=0
total_oud=0
total_wildfly=0

for i in $(cat list-ENV.txt);
        do
		    # detects how many proccess, write the values to log and sum to total_XXX variable
			# WLS - WebLogic Server
            OS_VER=$( SSHPASS=$PASS ./sshpass -e  ssh -o StrictHostKeyChecking=no -o NumberOfPasswordPrompts=1 root@$i " echo 'WebLogic' ; ps aux | grep -i java  | grep weblogic.Server | grep -v grep | wc -l" ) 2>/dev/null
            echo $i $OS_VER >> $result
            WLS1=$( SSHPASS=$PASS ./sshpass -e  ssh -o StrictHostKeyChecking=no -o NumberOfPasswordPrompts=1 root@$i "ps aux | grep -i java  | grep weblogic.Server | grep -v grep | wc -l" ) 2>/dev/null
            total_wls=$(($total_wls + $WLS1))
			
			# OEM - Oracle Enterprise Manager Agent
			#OS_VER=$( SSHPASS=$PASS ./sshpass -e  ssh -o StrictHostKeyChecking=no -o NumberOfPasswordPrompts=1 root@$i " echo 'OEM agent' ; ps aux | grep -i java  | egrep agent | egrep gcagent | grep -v grep | wc -l" ) 2>/dev/null
            #echo $i $OS_VER >> $result
            #OEM1=$( SSHPASS=$PASS ./sshpass -e  ssh -o StrictHostKeyChecking=no -o NumberOfPasswordPrompts=1 root@$i "ps aux | grep -i java  | egrep agent | egrep gcagent | grep -v grep | wc -l" ) 2>/dev/null
            #total_oem=$(($total_oem + $OEM1))
			
			# NM - NodeManager
            #OS_VER=$( SSHPASS=$PASS ./sshpass -e  ssh -o StrictHostKeyChecking=no -o NumberOfPasswordPrompts=1 root@$i " echo 'NodeManager ' ; ps aux | grep -i java  | grep weblogic.NodeManager | grep -v grep | wc -l" ) 2>/dev/null
			#echo $i $OS_VER >> $result
            #NM1=$( SSHPASS=$PASS ./sshpass -e  ssh -o StrictHostKeyChecking=no -o NumberOfPasswordPrompts=1 root@$i "ps aux | grep -i java  | grep weblogic.NodeManager | grep -v grep | wc -l" ) 2>/dev/null
            #total_nm=$(($total_nm + $NM1))
			
		    # ODI - Oracle Data Integrator
            OS_VER=$( SSHPASS=$PASS ./sshpass -e  ssh -o StrictHostKeyChecking=no -o NumberOfPasswordPrompts=1 root@$i " echo 'ODI ' ; ps aux | grep -i java  | grep weblogic.Server | grep opss.version | grep odi | grep -v AdminServer | grep -v grep | wc -l" ) 2>/dev/null
            echo $i $OS_VER >> $result
            ODI1=$( SSHPASS=$PASS ./sshpass -e  ssh -o StrictHostKeyChecking=no -o NumberOfPasswordPrompts=1 root@$i "ps aux | grep -i java  | grep weblogic.Server | grep opss.version | grep odi | grep -v AdminServer | grep -v grep | wc -l" ) 2>/dev/null
            total_odi=$(($total_odi + $ODI1))

		    # SOA - Oracle SOA Suite
            OS_VER=$( SSHPASS=$PASS ./sshpass -e  ssh -o StrictHostKeyChecking=no -o NumberOfPasswordPrompts=1 root@$i " echo 'SOA ' ; ps aux | grep -i java  | grep weblogic.Server | grep jrf.version | grep soa | grep -v AdminServer | grep -v grep | wc -l" ) 2>/dev/null
            echo $i $OS_VER >> $result
            SOA1=$( SSHPASS=$PASS ./sshpass -e  ssh -o StrictHostKeyChecking=no -o NumberOfPasswordPrompts=1 root@$i "ps aux | grep -i java  | grep weblogic.Server | grep jrf.version | grep soa | grep -v AdminServer | grep -v grep | wc -l" ) 2>/dev/null
            total_soa=$(($total_soa + $SOA1))

		    # OAM - Oracle SOA Suite
            OS_VER=$( SSHPASS=$PASS ./sshpass -e  ssh -o StrictHostKeyChecking=no -o NumberOfPasswordPrompts=1 root@$i " echo 'OAM ' ; ps aux | grep -i java  | grep weblogic.Server | grep jrf.version | grep oam | grep IDM | grep -v AdminServer | grep -v grep | wc -l" ) 2>/dev/null
            echo $i $OS_VER >> $result
            OAM1=$( SSHPASS=$PASS ./sshpass -e  ssh -o StrictHostKeyChecking=no -o NumberOfPasswordPrompts=1 root@$i "ps aux | grep -i java  | grep weblogic.Server | grep jrf.version | grep oam | grep IDM | grep -v AdminServer | grep -v grep | wc -l" ) 2>/dev/null
            total_oam=$(($total_oam + $OAM1))

		    # OIM - todo better ps aux filters
            OS_VER=$( SSHPASS=$PASS ./sshpass -e  ssh -o StrictHostKeyChecking=no -o NumberOfPasswordPrompts=1 root@$i " echo 'OIM ' ; ps aux | grep -i java  | grep weblogic.Name |grep oim | grep -v NodeManager | grep -v AdminServer | grep -v grep | wc -l" ) 2>/dev/null
            echo $i $OS_VER >> $result
            OIM1=$( SSHPASS=$PASS ./sshpass -e  ssh -o StrictHostKeyChecking=no -o NumberOfPasswordPrompts=1 root@$i "ps aux | grep -i java  | grep weblogic.Name |grep oim | grep -v NodeManager | grep -v AdminServer | grep -v grep | wc -l" ) 2>/dev/null
            total_oim=$(($total_oim + $OIM1))
			
		    # OID - todo better ps aux filters
            OS_VER=$( SSHPASS=$PASS ./sshpass -e  ssh -o StrictHostKeyChecking=no -o NumberOfPasswordPrompts=1 root@$i " echo 'OID ' ; ps aux | grep -i java  | grep weblogic.Server | grep -i oid | grep -v NodeManager | grep -v AdminServer | grep -v grep | wc -l" ) 2>/dev/null
            echo $i $OS_VER >> $result
            OID1=$( SSHPASS=$PASS ./sshpass -e  ssh -o StrictHostKeyChecking=no -o NumberOfPasswordPrompts=1 root@$i "ps aux | grep -i java  | grep weblogic.Server | grep -i oid | grep -v NodeManager | grep -v AdminServer | grep -v grep | wc -l" ) 2>/dev/null
            total_oid=$(($total_oid + $OID1))

		    # OUD - todo better ps aux filters
            OS_VER=$( SSHPASS=$PASS ./sshpass -e  ssh -o StrictHostKeyChecking=no -o NumberOfPasswordPrompts=1 root@$i " echo 'OUD ' ; ps aux | grep -i java  | grep start-ds | grep -i oud | grep -v NodeManager | grep -v AdminServer | grep -v grep | wc -l" ) 2>/dev/null
            echo $i $OS_VER >> $result
            OUD1=$( SSHPASS=$PASS ./sshpass -e  ssh -o StrictHostKeyChecking=no -o NumberOfPasswordPrompts=1 root@$i "ps aux | grep -i java  | grep start-ds | grep -i oud | grep -v NodeManager | grep -v AdminServer | grep -v grep | wc -l" ) 2>/dev/null
            total_oud=$(($total_oud + $OUD1))
            
		    # Wildfly
            OS_VER=$( SSHPASS=$PASS ./sshpass -e  ssh -o StrictHostKeyChecking=no -o NumberOfPasswordPrompts=1 root@$i " echo 'Wildfly ' ; ps aux | grep -i java | grep -i wildfly | grep -v grep | wc -l" ) 2>/dev/null
            echo $i $OS_VER >> $result
            WF1=$( SSHPASS=$PASS ./sshpass -e  ssh -o StrictHostKeyChecking=no -o NumberOfPasswordPrompts=1 root@$i "ps aux | grep -i java | grep -i wildfly | grep -v grep | wc -l" ) 2>/dev/null
            total_wildfly=$(($total_wildfly + $WF1))

			tail -n8 $result
done

# print to the screen
echo "Total WebLogic Server " $total_wls
echo "Total WebLogic Server " $total_wls >> $result
#echo "Total OEM agent " $total_oem
#echo "Total NodeManager " $total_nm
echo "Total ODI " $total_odi
echo "Total ODI " $total_odi >> $result
echo "Total SOA " $total_soa
echo "Total SOA " $total_soa >> $result
echo "Total OAM " $total_oam
echo "Total OAM " $total_oam >> $result
echo "Total OIM " $total_oim
echo "Total OIM " $total_oim >> $result
echo "Total OID " $total_oid
echo "Total OID " $total_oid >> $result
echo "Total OUD " $total_oud
echo "Total OUD " $total_oud >> $result
echo "Total Wildfly " $total_wildfly
echo "Total Wildfly " $total_wildfly >> $result

cat $result

# WLS
# "ps aux | grep -i java  | grep weblogic.Server | grep -v grep | wc -l"
# OEM
# "ps aux | grep -i java  | egrep agent | egrep gcagent | grep -v grep | wc -l"
# NM
# "ps aux | grep -i java  | grep weblogic.NodeManager | grep -v grep | wc -l"
# ODI
# "ps aux | grep -i java  | grep weblogic.Server | grep opss.version | grep odi | grep -v AdminServer | grep -v grep | wc -l"
# SOA
# "ps aux | grep -i java  | grep weblogic.Server | grep jrf.version | grep soa | grep -v AdminServer | grep -v grep | wc -l"
# OID 
# ps aux | grep -i java  | grep weblogic.Server | grep -i oid | grep -v NodeManager | grep -v AdminServer | grep -v grep | wc -l
# OUD
# ps aux | grep -i java  | grep start-ds | grep -i oud | grep -v NodeManager | grep -v AdminServer | grep -v grep | wc -l
# Wildfly
# ps aux | grep -i java | grep -i wildfly | wc -l

