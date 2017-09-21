#!/bin/bash

# Extract IP address for kvm-based VMs from their MAC adresses

for i in $(virsh list --name)
do
	arp -an | grep $(virsh dumpxml $i | grep 'mac address' | head -1 | sed "s/.*'\(.*\)'.*/\1/g")
done

