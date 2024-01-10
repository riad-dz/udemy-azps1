function Create-AzureReport {

    Param(
     [parameter(mandatory=$true)] [string] $subscription_Id,
     [parameter(mandatory=$true)] [string] $tenant_Id,
     [parameter(mandatory=$true)] [string] $resource_group

    )


    ####### Azure Connection  ########


    Set-AzContext -SubscriptionId $subscription_Id -Tenant $tenant_Id

    $resources = Get-AzResource -ResourceGroupName $resource_group


    ####### Azure  Report Creation ########

    $report_file = "azure_report.txt"

    if (Test-Path $report_file -PathType leaf)

    {

        Write-Host "Report file already exists and it will be reinitialized ..........."
        Clear-Content $report_file
        Write-Host "Azure report reinitialized successfully "
    }

    else {

        Write-Host "Azure Report Creation ........."
        New-Item -Path . -Name $report_file -ItemType "file"

        Write-Host "Azure Report created successfully"


    }

    ####### Total number of resources  ##########

    $total_resources = $resources.Count


    Add-Content -Path $report_file -Value "########## Total number of Resources ##########"
    Add-Content -Path $report_file -Value ""
    Add-Content -Path $report_file -Value "Total number of resources in the RG --> $total_resources"
    Add-Content -Path $report_file -Value ""


    ####### Description of Azure Resources  ##########
    
    Add-Content -Path $report_file -Value "####### Description of Azure Resources  ##########"

    foreach ($resource in $resources)
    {

        Add-Content -Path $report_file -Value "    Name:  $($resource.Name )      |      ResourceType:  $($resource.ResourceType.Split("/")[1])     |     Location:  $($resource.Location)"
    
        Add-Content -Path $report_file -Value ""

    }

}

$subscription_Id = Read-Host "Please, insert the Azure Subscription ID"
$tenant_Id = Read-Host "Please, insert the Azure Tenant ID"
$rg = Read-Host "Please, insert the Azure RG name"

Create-AzureReport $subscription_Id $tenant_Id $rg