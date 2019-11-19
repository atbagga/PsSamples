param(
    [Int]$pipelineid
)

$id = az pipelines run --id $pipelineid --query id -o tsv

$status = 'inProgress'
while($status -eq 'inProgress' -or  $status -eq 'notStarted') {
	$result = az pipelines runs show --id $id --query [status,result] -o json | ConvertFrom-Json
	$status = $result[0]
	Start-Sleep -seconds 1 ## set to high number to avoid getting throttled.
}

if($result[1] -eq "succeeded"){
   write-host("Completed successfully")
}
else {
   write-host("Failed to complete. Please debug.")
}