# 'resque-scheduler' is an optional plugin for rescue which allows you to easily setup scheduled jobs.
# You don't need it if you just want to move basic processes into background jobs and queue them
# up when certain events happen in your code.
#
# Documentation for this gem:
#
# https://github.com/resque/resque

require 'resque/tasks'

namespace :resque do
  task :setup do
    require 'resque'
    ENV['QUEUE'] = '*'

    Resque.redis = 'localhost:6379' unless Rails.env == 'production'
  end
end

Resque.after_fork = Proc.new { ActiveRecord::Base.establish_connection } #this is necessary for production environments, otherwise your background jobs will start to fail when hit from many different connections.

desc "Alias for resque:work (To run workers on Heroku)"
task "jobs:work" => "resque:work"
