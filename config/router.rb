Merb.logger.info("Compiling routes...")
Merb::Router.prepare do
  resources :posts do
    resources :comments
  end
  
  slice(:merb_auth_slice_password, :name_prefix => nil, :path_prefix => "")
  default_routes
  
  match('/').to(:controller => 'posts', :action =>'index')
end