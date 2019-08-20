# Use

This script can be used to programatically link variable groups to azure pipelines using Azure Devops CLI. 
Ideally the variable group should be part of yaml definition itself but in special cases when the workflow requires you to assign custom named variable groups this script can be used. 

## To invoke

`VarGroupUpdate.ps1 -org https://dev.azure.com/atbagga -project variablegroupdemo -pipelineid 14 -vargroupid 5041`

## Other commands

You can use other commands from `az pipelines variable-group` command group to create/update variable groups and also to get the variable group-id from name if required.

