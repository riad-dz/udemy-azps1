##### Set-AzContext with read-host variable #####

$subscription_id = Read-Host "Please, insert your Azure Subscription ID"

Set-AzContext -SubscriptionId $subscription_id