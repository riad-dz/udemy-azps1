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

$vm_name =  "az-vm2"

$location= "northeurope"

$os_image=  "MicrosoftWindowsServer:WindowsServer:2022-Datacenter:latest"

$vm_size=  "Standard_B2s"

$ip_name=  "ip2"


New-AzVm -ResourceGroupName $rg_name -Name $vm_name -Location $location -ImageName $os_image -size $vm_size -PublicIpAddressName $ip_name -OpenPorts 80 