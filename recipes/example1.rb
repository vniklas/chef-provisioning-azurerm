require 'chef/provisioning/azurerm'
with_driver 'AzureRM:abcd1234-YOUR-GUID-HERE-abcdef123456'

azure_resource_group 'niklasa-demo' do
  location 'West US' # optional, default: 'West US'
  tags businessUnit: 'NIC' # optional
end

azure_resource_template 'my-deployment' do
  resource_group 'niklasa-demo'
  template_source 'cookbooks/provision/files/default/azure_deploy.json'
  parameters newStorageAccountName: "mystorageaccount01",
             adminUsername: 'niklasa',
             adminPassword: 'P2ssw0rd',
             dnsNameForPublicIP: "my-demo-server",
             windowsOSVersion: '2012-R2-Datacenter'
  chef_extension client_type: 'ChefClient',
                 version: '1210.12',
                 runlist: 'role[demo1]'
end