Gusteau::Application.routes.draw do
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "registro" => "users#new", :as => "sign_up"

  resources :users
  resources :sessions
  resources :products


  # The priority is based upon order of creation:
  # first created -> highest priority.

  resources :tables do
    resources :orders, :except => [:create]
  end
  # Sample of regular route:
  #   match 'la_lana' => 'orders#index', :as => 'orders'
  # Keep in mind you can assign values other than :controller and :action
  resources :orders, :except => [:create] do
    member do
      get 'checkout'
      post 'close'
      get 'receipt'
      get 'cancel'
    end
  end

  post 'order_items/create' => 'order_items#create', :as => 'add_order_item'
  get 'order_items/search_products' => 'order_items#search_products'
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
  root :to => 'tables#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
