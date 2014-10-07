Rails.application.routes.draw do
  resources :searches

  resources :applies

  resources :applications

  get 'admin/index'

  resources :fields
  resources :jobs
  resources :users
  resources :tags
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
    get 'logout' => :destroy
  end

  root :to => 'sessions#index'

  match ':controller(/:action(/:id))', :via => [:get, :post]

  resources :sessions
  resources :jobseekers

  match 'searches' => "searches#index", :via => :get
  match 'jobs/:id' => 'searches#show', :as => 'job1', :via => :get
  match 'search' => 'searches#search', :as => 'search1', :via => :get
  match 'search_results' => 'searches#search_results',
        :as => 'search_results', :via => :post

end
