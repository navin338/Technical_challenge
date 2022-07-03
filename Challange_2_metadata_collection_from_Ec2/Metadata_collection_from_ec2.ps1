<# Script:V1#>
<# AWS CLI used to automate this script #>
Write-Host -ForegroundColor Green "----------------------------------------------------------------------"
Write-Host -ForegroundColor Green "script helps to pull the metadata of ec2-Instance"
Write-Host -ForegroundColor Green "----------------------------------------------------------------------"

$profile_name = Read-Host -Prompt "Enter the profile Name"

$output_formate = Read-Host -Prompt "Required format json or text or table"
$ec2_resource_metadata = aws ec2 describe-instances --profile $profile_name --output $output_formate
$ec2_resource_metadata
Write-Host -ForegroundColor Green "----------------------------------------------------------------------"
Write-Host -ForegroundColor Green "Please check the ec2 Metadata and updat the query based on requirment"
Write-Host -ForegroundColor Green "----------------------------------------------------------------------"

$query = Read-Host -Prompt "Enter the keyword, ex:[InstanceId,Name,InstanceType,etc..]"
$query_list = "Reservations[*].Instances[*]"

$value = aws ec2 describe-instances --profile $profile_name --query "$query_list.$query" --output json --no-verify-ssl
return $value 







