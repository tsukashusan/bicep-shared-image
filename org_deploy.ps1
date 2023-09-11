set-variable -name TENANT_ID "16b3c013-d300-468d-ac64-7eda0820b6d3" -option constant
set-variable -name SUBSCRIPTOIN_GUID "be7d3851-09f6-433c-8da5-09aace58dcd2" -option constant

$bicepFile = "main.bicep"
$parameterFile = "azuredeploy.parameters.dev4devClient.json"
$resourceGroupName = "shared-image"
$moduleame = "createUbuntu224DevImage"

Connect-AzAccount -Tenant ${TENANT_ID} -Subscription ${SUBSCRIPTOIN_GUID}

New-AzResourceGroupDeployment `
  -Name createwinsrvimage `
  -ResourceGroupName ${resourceGroupName} `
  -TemplateFile ${bicepFile} `
  -TemplateParameterFile ${parameterFile} `
  -moduleName ${moduleame} `
  -Verbose