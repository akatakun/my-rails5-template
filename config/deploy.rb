# config valid for current version and patch releases of Capistrano
lock '~> 3.11.0'

set :repo_url, ENV.fetch('REPO_URL', 'https://github.com/akatakun/my-rails5-template.git')
set :branch, ENV.fetch('BRANCH', 'master')

set :application, 'my-rails5-template'

set :rbenv_ruby, File.read('.ruby-version').strip

set :ssh_options, {
  keys: ['./etc/ssh/my-rails5-template.pem'],
  user: 'ec2-user',
}

linked_filenames = ['config/master.key', '.env', 'config/database.yml']
linked_dirnames  = ['tmp/pids', 'tmp/sockets', 'log']

namespace :deploy do
  after 'deploy:check:make_linked_dirs', 'deploy:upload'
  desc 'Upload untracking files'
  task :upload do
    on roles :all do
      linked_filenames.each do |file|
        upload!(file, "#{shared_path}/#{file}")
      end
    end
  end
end

append :linked_files, *linked_filenames
append :linked_dirs,  *linked_dirnames

# Puma
set :puma_threads,     [5, 10]
set :puma_workers,     0
set :puma_bind,        "unix://#{shared_path}/tmp/sockets/puma.sock"
set :puma_state,       "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,         "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log,  "#{shared_path}/log/puma.access.log"
set :puma_error_log,   "#{shared_path}/log/puma.error.log"
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true

set :whenever_identifier, ->{"#{fetch(:application)}_#{fetch(:stage)}"}
