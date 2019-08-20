
param(
    [String]$org,
    [String]$project,
    [int] $pipelineid,
    [int] $vargroupid
)

Write-Host "Get pipeline object - latest version"
$pipeline = az pipelines show --id $pipelineid --org $org --project $project -o json | ConvertFrom-Json

If ($pipeline.variableGroups.Count -eq 0) { $pipeline.variableGroups = @(@{"id"=$vargroupid}) }
Else {
    # Manipulate pipeline definition object to add a new variable group to it.
    $NewVarGroup = $pipeline.variableGroups += @{"id"=$vargroupid}
    $pipeline.variableGroups = $NewVarGroup
}

# Write this json object to a file 
$pipeline | ConvertTo-Json -depth 100 | Out-File -Encoding ascii ./infile_update.txt

Write-host "Updating pipeline to add variable group"
$newpipeline = az devops invoke --http-method PUT --area build --resource definitions --route-parameters project=$project definitionId=$pipelineid -o json --in-file .\infile_update.txt --encoding ascii
