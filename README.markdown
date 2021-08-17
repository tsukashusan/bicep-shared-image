# Shared Image Gallery

## Preparation
1. Install az cli  
https://docs.microsoft.com/ja-jp/cli/azure/install-azure-cli
1. bicep install
https://github.com/Azure/bicep/blob/main/docs/installing.md#windows-installer
4. bicep install (for Powershell)</br>
[Setup your Bicep development environment](https://github.com/Azure/bicep/blob/main/docs/installing.md#manual-with-powershell)
1. Edit parameter File
- azuredeploy.parameters.dev.json
  - require
    - YYYY-MM-DD -> ex.) 2022-06-30
    - \_gallaryName\_ -> ex.) samplegallary
    - \_ImageDefinitionName\_ -> ex.)sampledefinition
    - \_imageVertionName\_ -> ex.) 1.0.0
    - \_offer\_ -> ex.) sampleoffer
    - \_publisher\_ -> ex.) samplepublisher
    - \_sku\_ -> ex.) samplesku
    - \_ostype\_ Please Choose __Windows__ or __Linux__
    - \_VirtualMachineID\_ Target of Vrtual MachineId (ex.__/subscriptions/\<subscriptionId\>/resourceGroups/\<resourceGroupName\>/providers/Microsoft.Compute/virtualMachines/\<VirtualMachineName\>__)
```
{
    "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {
        "description": {
            "value": "Shared Image Gallery for Synapse Demonstration"
        },
        "endOfLifeDate": {
          "value" : "YYYY-MM-DD"
        },
        "galleryName": {
          "value": "_gallaryName_"
        },
        "hyperVGeneration":{
          "value": "V2"
        },
        "imageDefinitionName":{
          "value": "_ImageDefinitionName_"
        },
        "imageVertionName": {
          "value": "_imageVertionName_"
        },
        "location":{
          "value": "japanwest"
        },
        "offer":{
            "value": "_offer_"
        },
        "publisher":{
          "value": "_publisher_"
        },
        "sku":{
          "value": "_sku_"
        },
        "replicaCount":{
          "value": 1
        },
        "osType":{
          "value": "_ostype_"
        },
        "osState":{
          "value": "Specialized"
        },
        "sourceVMImageId":{
          "value": "_VirtualMachineID_"
        },
        "targetRegions":{
          "value": [
            {
              "name": "japaneast",
              "regionalReplicaCount": 1
            },
            {
              "name": "japanwest",
              "regionalReplicaCount": 1             
            }
          ]
        }
    }
}
```
### (Option)
#### If you use powershell(or pwsh)
1. Install Module Az or Update Module Az  (Az Version >= 5.8.0)
```
 Install-Module Az
```
or
```
Update-Module Az
```
## Usage
### STEP 1
1. Execute PowerShell Prompt
1. Set Parameter(x)

```
set-variable -name TENANT_ID "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" -option constant
set-variable -name SUBSCRIPTOIN_GUID "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" -option constant

$bicepFile = "main.bicep"
$parameterFile = "azuredeploy.parameters.dev.json"
$resourceGroupName = "xxxxx"
$location = "xxxxx"
```

2. Go to STEP2 (Azure CLI or PowerShell)
### STEP 2 (PowerShell)
1. Azure Login
```
Connect-AzAccount -Tenant ${TENANT_ID} -Subscription ${SUBSCRIPTOIN_GUID}
```
2. Create Resource Group  
```
New-AzResourceGroup -Name ${resourceGroupName} -Location ${location} -Verbose
```
3. Deployment Create  
```
New-AzResourceGroupDeployment `
  -Name devenvironment `
  -ResourceGroupName ${resourceGroupName} `
  -TemplateFile ${bicepFile} `
  -TemplateParameterFile ${parameterFile} `
  -Verbose
```

### STEP 2 (Azure CLI)
1. Azure Login
```
az login -t ${TENANT_ID} --verbose
```
2. Set Subscription
```
az account set --subscription ${SUBSCRIPTOIN_GUID} --verbose
```
3. Create Resource Group  
```
az group create --name ${resourceGroupName} --location ${location} --verbose
```
4. Deployment Create  
```
az deployment group create --resource-group ${resourceGroupName} --template-file ${bicepFile} --parameters ${parameterFile} --verbose
```
