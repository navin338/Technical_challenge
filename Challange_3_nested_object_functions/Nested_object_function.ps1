<# powershell used to automate this script #>

function testfunction {

[cmdletbinding()]
param(
    $vm_details = @{}
)

begin{
$resourcegroupdetails = @{
 
resourcegroup_name = "TestRG"
location   = "westus2"
subscription = "Testsubscription"

}


$vnetdetails = @{
vnet_name = "Test_Vnet_1"
subnet = 10.0.2/28
primary = "true"
Ip_allocation = "static"
}

#$vm_details += $vnetdetails
#$vm_details += $resourcegroupdetails

$vm_details = $vm_details + $vnetdetails
$vm_details = $vm_details + $resourcegroupdetails

}

process {

$main_objects = @{

    resourcegroup_name = $resourcegroupdetails.resourcegroup_name
    resourcegroup_subscription = $resourcegroupdetails.subscription
    Resource_group_location = $vm_details.location
    IP_allocation = $vm_details.Ip_allocation
    
}
}

end {
$main_object = New-Object -Type psobject -Property $main_objects
Write-Output $main_object

}
}

return testfunction













