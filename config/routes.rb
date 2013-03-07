SaintsSinners::Application.routes.draw do


  #Omniauth-Facebook for Users
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, :path => "u", :controllers => { :registrations => "users/registrations", :sessions => "users/sessions" }
  match 'auth/:provider/callback', to: 'auth#create'
  match 'auth/failure', to: redirect('/')

  #Devise for Admins
  devise_for :admin_users, path_names: {sign_in: "login", sign_out: "logout"}, :path => "d", :controllers => { :registrations => "admin_users/registrations", :sessions => "admin_users/sessions" }

  #Management of Admins
  resources :admin_users

  root :to => 'welcome#index'
  
end
