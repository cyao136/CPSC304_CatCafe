Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'static_pages#home'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get 'login' => 'login#login'
  get 'sign_up' => 'login#sign_up'

  post 'login_submit' => 'login#login_submit'
  post 'sign_up_submit' => 'login#sign_up_submit'
  post 'employee_login_submit' => 'login#employee_login_submit'

  get 'member/:id' => 'member#main', as: :member
  post 'member/:id/adopt' => 'member#adopt', as: :adopt
  post 'member/:id/adopt_submit' => 'member#adopt_submit', as: :adopt_submit

  post 'member/:id/book' => 'member#book', as: :book
  post 'member/:id/book_submit' => 'member#book_submit', as: :book_submit

  get 'employee/:id' => 'employee#main', as: :employee
  post 'employee/:id/find_transaction' => 'employee#find_transaction'
  post 'employee/:id/find_by_refId' => 'employee#find_by_refId'
  post 'employee/:id/create_transaction' => 'employee#create_transaction'
  post 'employee/:id/edit_transaction' => 'employee#edit_transaction'
  post 'employee/:id/destroy_transaction' => 'employee#destroy_transaction'
  post 'employee/:id/find_item' => 'employee#find_item'
  post 'employee/:id/create_item' => 'employee#create_item'
  post 'employee/:id/edit_item' => 'employee#edit_item'
  post 'employee/:id/destroy_item' => 'employee#destroy_item'


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
