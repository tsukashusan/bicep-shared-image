set-variable -name TENANT_ID "<TENANT_ID>" -option constant
set-variable -name SUBSCRIPTOIN_GUID "<SUBSCRIPTOIN_GUID>" -option constant

$bicepFile = "main.bicep"
$parameterFile = "<parameterFile>"
$resourceGroupName = "<resourceGroupName>"
$moduleame = "<moduleame>"

Connect-AzAccount -Tenant ${TENANT_ID} -Subscription ${SUBSCRIPTOIN_GUID}

New-AzResourceGroupDeployment `
  -Name createwinsrvimage `
  -ResourceGroupName ${resourceGroupName} `
  -TemplateFile ${bicepFile} `
  -TemplateParameterFile ${parameterFile} `
  -moduleName ${moduleame} `
  -Verbose