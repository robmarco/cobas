Cobas::Application.routes.draw do
	get "responds/index"  
  get "files/index"
  get "userlists/index"
	match 'userslists/destroy/:id' => 'userlists#destroy', :as => 'userlist_destroy', :via => [:delete]
  
  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :registers do
  	resources :responds, :except => [:index]
  end

  resources :notifications, :except => [:new, :show]

  root :to => 'registers#index'

end
