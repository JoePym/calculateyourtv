# config/unicorn.rb
worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
timeout 15
preload_app true
cwd = if ENV['RAILS_ENV'] == 'production'
  File.join('/var', 'www', 'calculateyour.tv', 'current')
else
  config_dir = File.symlink?(__FILE__) ? File.readlink(__FILE__) : __FILE__
  File.expand_path('..', config_dir)
end
working_directory cwd
pid File.join(cwd, "tmp", "pids", "unicorn.pid")
listen File.join(cwd, "tmp", "sockets", "unicorn.sock")
before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end