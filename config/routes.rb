Rails.application.routes.draw do
  
  devise_for :users
  resources :home, only: [:index]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get '/api/v1/block/seats/:venue_id/:block_id' => 'api/v1/seats#index', :as => 'get_seats_of_block'
  
  resources :venues do
    resources :levels do
      resources :blocks do
        resources :seats
      end
    end
  end
  
  namespace :api do
    namespace :v1 do
      devise_scope :user do
        post '/forget_password' => 'passwords#create', :as => 'reset_password'
      end
      post '/registrations' => 'registrations#create'
      patch '/update' => 'registrations#update'
      post '/login' => 'sessions#create'
      delete '/logout' => 'sessions#destroy'
      #post '/add_ticket_detail' => 'tickets#add_ticket_detail'
      get '/get_ticket_detail' => 'tickets#get_ticket_detail'
      get '/get_seat_detail/:seat_number' => 'seats#get_seat_detail'
      get '/get_all_seat_details' => 'seats#get_all_seat_details'
      resources :venues, only: [:show] do
        resources :levels, only: [:index] do
          resources :blocks, only: [:index] do
            resources :seats, only: [:index]
          end
        end
      end
    end
  end
  # You can have the root of your site routed with "root"
  root 'home#index'
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
