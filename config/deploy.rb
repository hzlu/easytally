# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'easytally'
set :deploy_user, 'easytally'
set :default_stage, 'production'

# Default value for :scm is :git
set :scm, :git
set :repo_url, 'git@bitbucket.org:hzlu/easytally.git'

# setup RVM
set :rvm_ruby_version, '2.2.1'
set :rvm_custom_path, '/usr/local/rvm'

# Default branch is :master
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

set :deploy_to, '/var/www/easytally'
set :format, :pretty
set :log_level, :debug
set :pty, false

set :rails_env, 'production'
set :migration_role, 'db'
set :conditionally_migrate, false

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

set :bundle_flags, '--deployment'

set :keep_releases, 5

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end

namespace :upload_setting do
  desc 'scp local setting files to shared folder'
  task :setup do
    on roles(:app) do
      local_path = "../easytally_setting"
      upload! "#{local_path}/database.yml", "#{shared_path}/config/database.yml", via: :scp
      upload! "#{local_path}/secrets.yml", "#{shared_path}/config/secrets.yml", via: :scp
    end

  end
end

