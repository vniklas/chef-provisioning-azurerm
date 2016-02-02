require 'chef/provisioning/azurerm'
with_driver 'AzureRM:90cb812a-eb9b-4a1e-8fd7-75e6d367f760'

azure_resource_group 'nic-demo22' do
  location 'West US' # optional, default: 'West US'
  tags businessUnit: 'NIC' # optional
end

azure_resource_template 'nic-deployment' do
  resource_group 'nic-demo22'
  template_source 'azure_deploy.json'
  parameters adminUsername: 'niklasa',
             adminPassword: 'P2ssw0rd',
             windowsOSVersion: '2012-R2-Datacenter',
             dnsLabelPrefix: 'vniklasnic22'        
  chef_extension client_type: 'ChefClient',
                 version: '1210.12',
                 client_rb: '',
                 runlist: 'role[demo1]'
end
