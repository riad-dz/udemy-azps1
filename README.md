# Repository's utility #

This Github repo contains all powershell scripts needed to learn basic Automation in Azure and practice the Udemy course: **Deploying your first infrastructure in Azure with Powershell**

URL of the course: https://www.udemy.com/course/deploying-your-first-infrastructure-in-azure-with-powershell


# Installation of Azure Powershell modules

Open your Powershell Terminal as an Administrator, then type: 

- **Install-Module -Name Az -Repository PSGallery -Force**

# Scripts & Execution steps #

## Connect-AzAccount ##
Connect to your Azure Tenant by using **Connect-AzAccount** command in your Powershell Terminal: 

- **Set-ExecutionPolicy -Score CurrentUser Unrestricted** 
- **Connect-AzAccount**


## Set-AzContext ##

Connect to your Azure Subscription and set your Azure context, use **az_context.ps1** script in your terminal (you can also use az_context2.ps1): 

- **az_context.ps1 "precise_your_azure_subscription_id"**


## Create Azure resource group ##

Execute **rg.ps1 script** to create your first Azure Resource group:  
- **.\rg.ps1**
Type your resource group name in the terminal

## Create Azure VM ##

Create your first Linux VM in Azure -> execute vm.ps1 in your terminal:
-  **.\vm.ps1** 
Insert all needed parameters

The same procedure can be done to create your first Windows Server VM in Azure -> execute vm2.ps1 in your Terminal: 
- **.\vm2.ps1** 
Insert all needed parameters

## Create a report of your Azure Resources ##

Create a report of your Azure resources, using **azure_report.ps1 script** (3 parameters to precise):

- **.\azure_report.ps1 "Azure_Subscription_Id" "Azure_Tenant_Id" "Azure_resourcegroup_name"**