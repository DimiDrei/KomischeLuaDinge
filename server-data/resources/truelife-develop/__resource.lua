-- Manifest
resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'True Life - HC RP Server.'

-- Server
server_scripts {
  'Helper/server.lua',
  'Commands/server.lua',
}

-- Client
client_scripts {
  'Helper/client.lua', 
  'Commands/client.lua',
}