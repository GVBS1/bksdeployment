param containerGroups_bksinstances_name string = 'bksinstances'

resource containerGroups_bksinstances_name_resource 'Microsoft.ContainerInstance/containerGroups@2022-10-01-preview' = {
  name: containerGroups_bksinstances_name
  location: 'canadacentral'
  properties: {
    sku: 'Standard'
    containers: [
      {
        name: containerGroups_bksinstances_name
        properties: {
          image: 'bksregistry.azurecr.io/webimagev1:latest'
          ports: [
            {
              protocol: 'TCP'
              port: 80
            }
          ]
          environmentVariables: []
          resources: {
            requests: {
              memoryInGB: '1.5'
              cpu: 1
            }
          }
        }
      }
    ]
    initContainers: []
    imageRegistryCredentials: [
      {
        server: 'bksregistry.azurecr.io'
        username: 'BKSRegistry'
      }
    ]
    restartPolicy: 'OnFailure'
    ipAddress: {
      ports: [
        {
          protocol: 'TCP'
          port: 80
        }
      ]
      ip: '20.116.242.95'
      type: 'Public'
    }
    osType: 'Linux'
  }
}
