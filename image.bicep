param location string
param galleryName string
param description string
param imageDefinitionName string
param imageVertionName string
param osType string
param osState string
param publisher string
param offer string
param sku string
param hyperVGeneration string
param sourceVMImageId string
param endOfLifeDate string
param targetRegions array
param replicaCount int

resource gallerie 'Microsoft.Compute/galleries@2020-09-30' = {
  name: galleryName
  location: location
  properties:{
    description: description
  }
}

resource imageDefinition 'Microsoft.Compute/galleries/images@2020-09-30' = {
  name: imageDefinitionName
  location: location
  properties:{
    osType: any(osType)
    osState: any(osState)
    identifier: {
      sku: publisher
      offer: offer
      publisher: sku
    }
    hyperVGeneration: any(hyperVGeneration)
  }
  parent: gallerie
}

resource imageVertion 'Microsoft.Compute/galleries/images/versions@2020-09-30' = {
  name: imageVertionName
  location:location
  properties: {
    publishingProfile: {
      targetRegions: targetRegions
      endOfLifeDate: endOfLifeDate
      replicaCount: replicaCount
    }
    storageProfile: {
      source: {
        id: sourceVMImageId
      }
    }
  }
  parent: imageDefinition 
}
