param location string
param imageVertionName string
param sourceVMImageId string
param endOfLifeDate string
param targetRegions array
param replicaCount int


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
}
