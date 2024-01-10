#### Creation of new Azure Resource Group #####

$rg_name = Read-Host "Please, insert your resource group name in Azure"

$resourcegroups = Get-AzResourceGroup

$rg_exists= "false"

foreach ($rg in $resourcegroups)

{
if ($rg.ResourceGroupName -eq $rg_name)
{

#### Azure Resource group already existing ####
$rg_exists = "true"

Write-Host "Please, provide a new name for your RG creation"

}

}

if ($rg_exists -eq "false")

{
#### Azure resource group not existing ####
New-AzResourceGroup -Name $rg_name -Location "France Central"

}


