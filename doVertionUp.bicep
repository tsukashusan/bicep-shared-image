param moduleName string
param endOfLifeDate string
param imageVertionName string
param location string
param replicaCount int
param sourceVMImageId string
param targetRegions array

module createimage 'versionup.bicep' = {
  name: moduleName
  params: {
    endOfLifeDate: endOfLifeDate
    imageVertionName: imageVertionName
    location: location
    replicaCount: replicaCount
    sourceVMImageId: sourceVMImageId
    targetRegions: targetRegions
  }
}
