# azure-disk-encryptor

# GOAL - VIRTUAL MACHINE DATA DISK ENCRYPTION WITH CMK

Ensure that Azure VMs have their non boot disk volumes encrypted at rest.In
this use case you would need to audit a given azure subscription to check if
all of the virtual machines have their data disks encrypted at rest. If the
above audit returns any of the VM’s data disk as unencrypted, you would need
to remediate the same by creating an encryption key in keyvault and use the
same key to encrypt the unencrypted data disk. This remediation has to be
repeated for each VM of the subscription which was found vulnerable in the
audit phase of the task.

# Solution:

To run the script ./audit.bash

Before running add the following azure service principal into the environment variable

Create service principal and add necessary rbac roles

# Login to Azure CLI

export APP_ID="appID"

export PASSWORD="password"

export TENANT_ID="tenantID"

az login --service-principal --username $APP_ID --password $PASSWORD --tenant $TENANT_ID
