require "capistrano/scm/git"
require "capistrano/setup"
require "capistrano/deploy"

install_plugin Capistrano::SCM::Git

require "capistrano/rails/assets"
require "capistrano/rbenv"
require "capistrano/bundler"
require "capistrano/yarn"
require "capistrano/puma"

install_plugin Capistrano::Puma
install_plugin Capistrano::Puma::Nginx

Dir.glob("lib/capistrano/tasks/*.rake").each{|r| import r}
