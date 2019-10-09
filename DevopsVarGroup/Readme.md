# Pre-requisite

Azure CLI with Azure-Devops extension installed. 

Documentation links here -
1. Install [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest) 
2. Install [Azure-DevOps extension](https://docs.microsoft.com/en-us/azure/devops/cli/get-started?view=azure-devops)

# Use

This script can be used to programatically link variable groups to azure pipelines using Azure Devops CLI. 
Ideally the variable group should be part of yaml definition itself but in special cases when the workflow requires you to assign custom named variable groups this script can be used. 

## To invoke

`VarGroupUpdate.ps1 -org https://dev.azure.com/atbagga -project variablegroupdemo -pipelineid 14 -vargroupid 5041`

## Other commands

You can use other commands from `az pipelines variable-group` command group to create/update variable groups and also to get the variable group-id from name if required.

