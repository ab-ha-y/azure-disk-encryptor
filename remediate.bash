#!/bin/bash

az keyvault create --name ab-key-vault-vmcrypt --resource-group rg-ind-abhay --location centralindia --enable-soft-delete true --enable-purge-protection true --enabled-for-disk-encryption true

echo "Encrypting Data Disk..."
while IFS= read -r line
do
   cmd="az vm encryption enable --ids ${line} --disk-encryption-keyvault ab-key-vault-vmcrypt --volume-type DATA"
   eval ${cmd}
done < vmlist.txt
echo "Data Disk Encryption Completed."