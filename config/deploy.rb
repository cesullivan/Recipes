require 'bundler/capistrano' 
$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) 
set :rvm_type, :user
require 'rvm/capistrano'
set :application, "recipes"
set :repository,  "git@github.com:cesullivan/Recipes.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "localhost"                          # Your HTTP server, Apache/etc
role :app, "localhost"                          # This may be the same as your `Web` server
role :db,  "localhost", :primary => true # This is where Rails migrations will run
set :port, 2222
set :user, "vagrant"
set :deploy_to, "/home/vagrant/sites/recipes"
set :keep_release, 5
set :use_sudo, false

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch {File.join(current_path,'tmp','restart.txt')}"
   end
 end