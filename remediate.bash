#!/bin/bash

RG=rg-ind-xxxxx #Replace the resource group name to a valid one
LOC=centralindia #Change Azure location

echo "Creating Key Vault..."
KEYVAULT=$(cat /dev/urandom | tr -dc 'a-zA-Z' | fold -w 10 | head -n 1)
echo "${KEYVAULT}"
az keyvault create --name $KEYVAULT --resource-group $RG --location $LOC --enable-soft-delete true --enable-purge-protection true --enabled-for-disk-encryption true

echo "Encrypting Data Disk..."
while IFS= read -r line
do
   cmd="az vm encryption enable --ids ${line} --disk-encryption-keyvault $KEYVAULT --volume-type DATA"
   eval ${cmd}
done < vmlist.txt
echo "Data Disk Encryption Completed."