require 'chef/provisioning/azurerm'
with_driver 'AzureRM:90cb812a-eb9b-4a1e-8fd7-75e6d367f760'

azure_resource_group 'niklasa-demo22' do
  location 'West US' # optional, default: 'West US'
  tags businessUnit: 'NIC' # optional
end

azure_resource_template 'my-deployment' do
  resource_group 'niklasa-demo22'
  template_source 'azure_deploy.json'
  parameters newStorageAccountName: "mystorageaccount01",
             adminUsername: 'niklasa',
             adminPassword: 'P2ssw0rd',
             dnsNameForPublicIP: "nic16-demo-server",
             windowsOSVersion: '2012-R2-Datacenter',
             chef_node_name: 'nic16-demo-server',
             client_rb: 'demo1',
             chef_server_url: 'https://manage.chef.io/organizations/rtsab',
             validation_client_name: 'rtsab-validator',
             runlist: 'demo1',
             validation_key: "-----BEGIN RSA PRIVATE KEY-----\n MIIEpAIBAAKCAQEA7yum/nNvqXCLobdOs/JOYpv9a+fkHPJVe6JyJzHv2LenPoET\n 0GIMeCOwXRCNlNRppfTe36gA1pi+8OZC7c8u2cQsI0jhnrpSSYNYgdnibOQzf9wk\n egjpKxB2sMDPOMU4NOnYH391PQJhw5sK944hqCoVn7H8Z+LTcSFXortKj4A1Hl9A\n 2NsD2St8JtXomOKEUoJzPjVdNG9V/LemGT3dmw2tzIL/OPRadeYelgAkcC/6VjDv\n ZVobyTLkfcBzEDi+yGzFY5rR9zOfs3OkOJWJ2bRrARzXRpm6LRbCO1s/8j25IfxK\n 66kd2KzKPAf6lr2BGNCXMXwmx2R08LPAqDrd6QIDAQABAoIBAEh1cides7KizTrW\n PTrZKxRG7BUX8Q0wAePuCCWFxINkyH9wPZ+BRQPU1Cat0CcJ32QO9sLNtEtPhXGY\n YSiI/0msXC7ocqpTCoEJEPRuHWIeFNgkysxKDNImL79G+sDZRzkIq5iHVe6A3TuU\n qlLrtZir/1cdZjnXB3YbwuAjW+hzOiBrQCs3Ymy4+GEH0NCuQRZB/oU8BUmn6jK6\n rbGIeyBvujTO2zCyO4Dr/ct3iasEBGdg884cqbpGkfkDMJ9PdGaW17FVbs80ydVH\n oyKtKLksgj+xvezHqL9DmINUAOMG1OFc8oIbrAkmqQmTxMvoHg6HzUvAkAll3lqg\n iB8XHL0CgYEA/+NPQF0ITpaHCPvRBhFK4p4ic3+7FDrA/vNMR7NDp+HUkOm1T9Xo\n 8l1ci7gIbYMqX15jY9ZZuyTJtu6YZtnF7mCobjc0Hu+xtFaY2zDwAzaRK7kbUrkI\n qrwbnc+fDE7XC4LXsR6N903LE7RZMcDFgxXlbcJM74KE4997KJcc+ysCgYEA70Z3\n 5yELvZNCnOQuB6tboN9wK5eBsSvzOAUJhw/IQIQ0/dTgsKtLTdsKwdG27E+E7EuA\n teZjLqr7kTst2r8yGv5YxD//ZRsVwWgNkTxZ8G/U4AwkQfosfAFiMJfgMpFXSNtL\n E5rsHQDs5vEkGPJ6MOgQNQFpQ9qEJ7VRXZmNcTsCgYEAwyVbfz5z41swyE0i73mo\n noLyyxqSVa8pGEX72oKACjxTm+BgAe6kpJFGztcetkXdvrWBHtaNwAciPnxfhbB3\n HoBgcw1ullk+MMYJ9L+xiwHGXI3ipIewcGTcutFn/j7yCTlTvSQMKJoPUYusqiDV\n gE7mlXokqlPjfNUmW6JC29kCgYEA3+4dTOv6ZuMollheU8MlL7us6L8UG1G8gBMG\n xaYZjXeteFkAJ5dIFIcI3Dd+cE5DYjmPLa196TEP2u19jpkdNXIQdSpHxMHCbI0L\n FX9b1M90dHIohK6zbyKEWGHq6qhm/cJt0t1MWCCDlebcF5Tmklq8wD6f22boA5mH\n moeYff0CgYBshN8r2lzrA78xvIZTuUzf9GVoBy6mTmiMRYp1awdCpLgz+YdAJE/5\n u2S7WndZ1IEQiPTJ1m+LF1+qJLdWnQjv0wOaV9IZP9tR9MhFjP7eliVSzkaw96QR\n QD4CDnbzPQ0+WxTzIloOAtHu7EhTka8/el34HuockTbR1i28vU9Mkg==\n-----END RSA PRIVATE KEY-----"
 
  chef_extension client_type: 'ChefClient',
                 version: '1210.12',
                 client_rb: 'demo1',
                 runlist: 'role[demo1]'
end
