require 'chef/provisioning/azurerm'
with_driver 'AzureRM:90cb812a-eb9b-4a1e-8fd7-75e6d367f760'

azure_resource_group 'niklasa-demo22' do
  location 'West US' # optional, default: 'West US'
  tags businessUnit: 'NIC' # optional
end

azure_resource_template 'my-deployment' do
  resource_group 'niklasa-demo22'
  template_source '/chef/cookbooks/provision/templates/default/recipes/azure_deploy.json'
  parameters newStorageAccountName: "mystorageaccount01",
             adminUsername: 'niklasa',
             adminPassword: 'P2ssw0rd',
             dnsNameForPublicIP: "my-demo-server",
             windowsOSVersion: '2012-R2-Datacenter'
  chef_extension client_type: 'ChefClient',
                 version: '1210.12',
                 runlist: 'role[demo1]'
end
