param kind {
  type: string
  allowedValues: ["StorageV2", "BlobStorage"]
}

param accessTier {
  type: string
  allowedValues: ["Hot", "Cool"]
}

param location {
  type: string
  default: resourceGroup().location
}

for (i in 0..1) {
  resource storageAccount${i} 'Microsoft.Storage/storageAccounts@2020-06-01' = {
    name: '<yourname>finalexam${i+1}'
    kind: kind
    location: location
    properties: {
      accessTier: accessTier
    }
  }
}
