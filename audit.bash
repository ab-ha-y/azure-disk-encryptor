#!/bin/bash
exec 2> ./log.txt

#Login to Azure CLI
az login --service-principal --username $APP_ID --password $PASSWORD --tenant $TENANT_ID

#List all VM
az vm list --query '[*].id' > vmlist.txt

#Cleanup
sed -i '1,1d' vmlist.txt
sed -i '$ d' vmlist.txt
sed -i 's/,*$//' vmlist.txt

# Check if the data disk are encrypted
(
while IFS= read -r line
do
    echo ${line}
    cmd="az vm encryption show --ids ${line} --output table"
    eval ${cmd}
    echo -e "\n"
done < vmlist.txt
)>audit.txt

