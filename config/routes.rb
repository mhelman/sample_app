SampleApp::Application.routes.draw do

  get "advertisingkeywords/new"

  get "advkeywords/new"

  get "advkeywords/news"

  get "advertisingkeywords/news"

  resources :users
  resources :sessions,      :only => [:new, :create, :destroy]
  resources :campaigns
  resources :charts do
    collection do
      get 'basic_line'
      get 'line_ajax'
      get 'line_labels'
    end
  end
  
    root  :to => 'pages#home'
    match '/',    to: 'pages#home'
    match 'home',    to: 'pages#home'
    match '/about',   to: 'pages#about'
    match '/contact', to: 'pages#contact'
    match '/signup', to: 'users#new'
    match '/signin',  :to => 'sessions#new'
    match '/signout', :to => 'sessions#destroy'
    match '/campaigns', :to => 'campaigns#index'
    match '/advertisingkeywords/:id', :to => 'advertisingkeywords#show', :as => :advertisingkeyword
    match '/advertisingkeywords', :to => 'advertisingkeywords#index'
    match '/create', :to => 'campaigns#new'
    match '/createkeywords', :to => 'advertisingkeywords#new'
    match '/advkeywordstream', :to => 'advertisingkeywords#advkeywordsStream'
    match '/delete', :to => 'campaigns#destroy'
    match '/deletekeywords', :to => 'advertisingkeywords#destroy'
     match '/reports', :to => 'campaigns#reports'
     
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
