server '35.76.213.168', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/home/beni/.ssh/id_rsa'
