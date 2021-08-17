param moduleName string
param description string
param endOfLifeDate string
param galleryName string
param hyperVGeneration string
param imageDefinitionName string
param imageVertionName string
param location string
param offer string
param osType string
param osState string
param publisher string
param replicaCount int
param sku string
param sourceVMImageId string
param targetRegions array

module createimage 'image.bicep' = {
  name: moduleName
  params: {
    description: description
    endOfLifeDate: endOfLifeDate
    galleryName: galleryName
    hyperVGeneration: hyperVGeneration
    imageDefinitionName: imageDefinitionName
    imageVertionName: imageVertionName
    location: location
    offer: offer
    osType: osType
    osState: osState
    publisher: publisher
    replicaCount: replicaCount
    sku: sku
    sourceVMImageId: sourceVMImageId
    targetRegions: targetRegions
  }
}
