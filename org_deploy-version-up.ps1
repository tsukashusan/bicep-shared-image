set-variable -name TENANT_ID "<TENANT_ID>" -option constant

$bicepFile = "doVertionUp.bicep"
$parameterFile = "azuredeploy.parameters.dev4devClientVersionUp.json"
$resourceGroupName = "<resourceGroupName>"
$moduleame = "versionupDevClientUbuntu"

Connect-AzAccount -Tenant ${TENANT_ID} -Subscription ${SUBSCRIPTOIN_GUID}

New-AzResourceGroupDeployment `
  -Name devenvironment `
  -ResourceGroupName ${resourceGroupName} `
  -TemplateFile ${bicepFile} `
  -TemplateParameterFile ${parameterFile} `
  -moduleName ${moduleame} `
  -Verbose