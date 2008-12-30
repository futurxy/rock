require 'config/dependencies.rb'
 
use_orm :datamapper
use_test :rspec
use_template_engine :haml
 
Merb::Config.use do |c|
  c[:use_mutex] = false
  c[:session_store] = 'cookie'
  
  c[:session_secret_key]  = '9953633e2e2bf8a966119c1463538b1513bc19fe'
  c[:session_id_key] = '_._session_id'
  
  # Some global values, not controlled in a database. KISS, yo!
  c[:blog_title] = "Junglist Generation"
  c[:blog_admin_email] = "aj@junglist.gen.nz"
end
 
Merb::BootLoader.before_app_loads do
end
 
Merb::BootLoader.after_app_loads do
  DataMapper.auto_upgrade!
  User.create(:login => "admin", :password => "changeme", :password_confirmation => "changeme") unless User.count > 0
end
