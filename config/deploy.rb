# config valid only for current version of Capistrano
SSHKit.config.command_map[:rake] = "bundle exec rake"

  lock '3.4.0'

  set :application, 'atlasmonkey'
  set :repo_url, 'git@github.com:nurdymuny/atlasmonkey_api.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
  set :scm, :git
# Default deploy_to directory is /var/www/my_app_name
  set :deploy_to, '/var/www/atlasmonkey.com'
  set :branch, "ibeacon"
  set :env, fetch(:env, "production")
  set :rvm_ruby_version, '2.2.0'
  set :rvm_type, :system
  set :rvm_custom_path, '/home/ubuntu/.rvm'
  server '52.5.49.148', user: 'ubuntu', roles: %w{web app db}

  set :pty, true
# Default value for :scm is :git

# Default value for :format is :pretty
#  set :format, :pretty
  
  set :ssh_options, {
  forward_agent: true,
  auth_methods: ["publickey"],
  keys: %w(~/.ssh/id_rsa)
}
# Default value for :log_level is :debug
#set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
 set :keep_releases, 5

namespace :deploy do
    task :setup_config do
      on roles :all do
        execute "sudo ln -nfs #{current_path}/config/deploy/production/nginx.conf /etc/nginx/sites-enabled/atlasmonkey.com"
        #execute "sudo ln -nfs #{current_path}/config/deploy/production/unicorn_init.sh /etc/init.d/unicorn_atlasmonkey.com"
        #execute "mkdir -p #{shared_path}/config"
        #put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
        puts "Now edit the config files in #{shared_path}."
      end
    end
    
    #after :restart, :clear_cache do
    #  on roles(:web), in: :groups, limit: 3, wait: 10 do
    #    # Here we can do anything such as:
    #    # within release_path do
    #    #   execute :rake, 'cache:clear'
    #    # end
    #  end
    #end
    
    after 'deploy:publishing', 'deploy:restart'  
    task :restart, :clear_cache do
      on roles :all do
        execute "ps aux | grep 'unicorn' | awk '{print $2}' | xargs sudo kill -9"
        invoke 'unicorn:start'
      end
    end
end
