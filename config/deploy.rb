# config valid for current version and patch releases of Capistrano
lock '~> 3.11.0'

set :repo_url, ENV.fetch('REPO_URL', 'https://github.com/akatakun/my-rails5-template.git')
set :branch, ENV.fetch('BRANCH', 'master')

set :application, 'my-rails5-template'
set :migration_role, :db

append :linked_files, 'config/master.key', 'config/master.key'
append :linked_dirs,  'vendor/bundle', 'node_modules'
