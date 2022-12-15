import './modules/storage-accounts.bicep'

resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: '<your name>-asp'
  kind: 'B1'
}

deployIf(parameters.deployApp) {
  resource webApp 'Microsoft.Web/sites@2020-06-01' = {
    name: '<your name>-app'
    location: resourceGroup().location
    properties: {
      appServicePlan: appServicePlan
      siteConfig: {
        appSettings: [
          {
            name: 'MYSECRET'
            value: '<your secret value>'
          }
        ]
      }
    }
  }
}
