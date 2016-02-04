set :stage, :production
role :app, %w{ubuntu@52.5.49.148}
role :web, %w{ubuntu@52.5.49.148}
role :db, %w{ubuntu@52.5.49.148}
server '52.5.49.148', user: 'ubuntu', roles: %w{web app db}
set :ssh_options, {
                    keys: %w(~/.ssh/id_rsa),
                    forward_agent: true,
                    auth_methods: %w(publickey)
                }