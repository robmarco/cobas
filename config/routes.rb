Cobas::Application.routes.draw do

  resources :intern_notifications, :except => [:new, :show] do 
    get 'download', :on => :member
  end
  
  resources :notifications, :except => [:new, :show] do
    get 'download', :on => :member
  end

  resources :dossiers do
    resources :registers, :except => [:index, :show]
  end

  match 'dossiers/:id/download/:avatar_id' => 'registers#download', :as => 'download_register', :via => [:get]

  match 'registers' => 'registers#index'
  get "files/index"
  get "userlists/index"
	match 'userslists/destroy/:id' => 'userlists#destroy', :as => 'userlist_destroy', :via => [:delete]
  
  devise_for :users, :controllers => {:registrations => "registrations"}

  root :to => 'dossiers#index'

end
