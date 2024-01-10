$rg_name = Read-Host "Please, insert your resource group name in Azure"

$resourcegroups = Get-AzResourceGroup

$rg_exists= "false"

foreach ($rg in $resourcegroups)

{
if ($rg.ResourceGroupName -eq $rg_name)
{

$rg_exists = "true"

Write-Host "Please, provide a new name for your RG creation"

}

}

if ($rg_exists -eq "false")

{

New-AzResourceGroup -Name $rg_name -Location "France Central"

}


