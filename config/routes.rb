ActionController::Routing::Routes.draw do |map|
  map.resources :projects
  map.resource :account, :controller => "users"
  map.resources :password_resets
  map.resources :users
  map.resource :user_session

  map.root :controller => "pages", :action => "home"

  map.mission, 'mission', :controller => "pages", :action => "mission"
  map.home, 'home', :controller => "pages", :action => "home"
  map.about, 'about', :controller => "pages", :action => "about"
  
  map.pages 'pages/:action', :controller => "pages"
end
