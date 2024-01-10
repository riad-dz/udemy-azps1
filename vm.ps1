#######  Loop to check the existence of Azure RG #####

$rg_name = Read-Host "Please, insert the name of your existing Azure RG"

$resource_groups = Get-AzResourceGroup

$rg_exists= "false"

while ($rg_exists -eq "false")

{

foreach ($rg in $resource_groups)
{
  if ($rg.ResourceGroupName -eq $rg_name)
  {
     $rg_exists = "true"
     break
  }

}

if ($rg_exists -eq "false")
{

    $rg_name= Read-Host "Please, insert the correct name of the target RG"
}

else {
    Write-Host "Target RG name is correct .... Next step -> Azure VM Creation"
}

}

####### AZURE VM CREATION ######

$vm_name = Read-Host "Please, insert the name of the Azure VM to create"

$location= Read-Host "Please, insert the location of the Azure VM to create"

$os_image= Read-Host "Please, insert OS image of the Azure VM to create"

$vm_size= Read-Host "Please, insert the sizing of the Azure VM to create"

$ip_name= Read-Host "Please, insert the name of the PublicIpAddress"

$ssh_key_name= Read-Host "Please, insert the name of the SSH Key"


New-AzVm -ResourceGroupName $rg_name -Name $vm_name -Location $location -image $os_image -size $vm_size -PublicIpAddressName $ip_name -OpenPorts 80 -GenerateSshKey -SshKeyName $ssh_key_name