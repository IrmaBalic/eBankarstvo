EBankarstvo::Application.routes.draw do
<<<<<<< HEAD

  resources :problems do
=======
  resources :c_types

  resources :change_types

  resources :changes do
>>>>>>> origin/master
    post 'solve', on: :member
    post 'confirm', on: :member
    post 'decline', on: :member
    get 'solve_form', on: :member
  end

<<<<<<< HEAD
  resources :changes
=======
>>>>>>> origin/master

  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users

  resources :incidents do
    post 'solve', on: :member
    post 'confirm', on: :member
    post 'decline', on: :member
    get 'solve_form', on: :member
  end

  resources :reported_incidents

  resources :priorities

  resources :roles

  resources :categories
  
  root 'incidents#new'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
