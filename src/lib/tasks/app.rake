# -*- encoding: UTF-8 -*-

root_path   = File.expand_path(File.join(File.dirname(__FILE__), '..', '..'))
config_path = File.join(root_path, 'lib', 'puma.rb')
pid_path    = File.join(root_path, 'tmp', 'pids', 'puma.pid')
app_env     = ENV['APP_ENV']

namespace :app do
  desc 'Start app'
  task :start do
    sh "puma -C #{config_path} -e #{app_env}"
  end

  desc 'Stop app'
  task :stop do
    sh "kill -15 `cat #{pid_path}`"
  end
end

