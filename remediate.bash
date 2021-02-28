#!/bin/bash

echo "Creating Key Vault..."
KEYVAULT=$(cat /dev/urandom | tr -dc 'a-zA-Z' | fold -w 10 | head -n 1)
echo "${KEYVAULT}"
az keyvault create --name $KEYVAULT --resource-group rg-ind-abhay --location centralindia --enable-soft-delete true --enable-purge-protection true --enabled-for-disk-encryption true

echo "Encrypting Data Disk..."
while IFS= read -r line
do
   cmd="az vm encryption enable --ids ${line} --disk-encryption-keyvault $KEYVAULT --volume-type DATA"
   eval ${cmd}
done < vmlist.txt
echo "Data Disk Encryption Completed."