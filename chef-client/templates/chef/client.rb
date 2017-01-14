log_level          :info
log_location      "/var/log/chef/client.log"
ssl_verify_mode    :verify_none
chef_server_url    "https://10.5.100.9:443"
validation_client_name   'blr-validator'
validation_key           '/etc/chef/blr-validator.pem'
file_cache_path    "/var/cache/chef"
file_backup_path  "/var/lib/chef/backup"
pid_file          "/var/run/chef/client.pid"
#cache_options({ :path => "/var/cache/chef/checksums", :skip_expires => true})
signing_ca_user "chef"
Mixlib::Log::Formatter.show_time = true
begin
  require 'chef_reporting'
  start_handlers << Chef::Reporting::StartHandler.new()
rescue LoadError
  Chef::Log.warn "Failed to load #{lib}. This should be resolved after a chef run."
end
Ohai::Config[:plugin_path] <<  "/etc/chef/ohai-plugins"
