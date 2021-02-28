# azure-disk-encryptor

To run the script ./audit.bash

Before running add the following azure service principal into the environment variable

Create service principal and add necessary rbac roles

#Login to Azure CLI

export APP_ID="appID"

export PASSWORD="password"

export TENANT_ID="tenantID"

az login --service-principal --username $APP_ID --password $PASSWORD --tenant $TENANT_ID
