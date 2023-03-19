@allowed([
  'Standard_LRS'
  'Standard_GRS'
])
@description('Storage experiments')
param saType string = 'Standard_LRS'

@description('RG Location')
param rgLocation string = resourceGroup().location

var saName = 'storage${uniqueString(resourceGroup().id)}'

resource storAcnt 'Microsoft.Storage/storageAccounts@2022-09-01' ={
  name: saName
  location: rgLocation
  sku :{
    name:saType
  }
  kind: 'StorageV2'
  properties:{
    supportsHttpsTrafficOnly: true
  }
}

output saName string = storAcnt.name
