ActionController::Routing::Routes.draw do |map|
  map.resources :news_items

  map.resources :projects
  map.resource :account, :controller => "users"
  map.resources :password_resets
  map.resources :users
  map.resource :user_session

  map.root :controller => "pages", :action => "home"

  map.mission 'mission', :controller => "pages", :action => "mission"
  map.home 'home', :controller => "pages", :action => "home"
  map.about 'about', :controller => "pages", :action => "about"
  map.help 'help', :controller => "pages", :action => "help"
  map.login 'login', :controller => "user_sessions", :action => "new"
  map.login 'logout', :controller => "user_sessions", :action => "destroy"
  map.register 'register', :controller => "users", :action => "new"
  
  map.pages 'pages/:action', :controller => "pages"
end
