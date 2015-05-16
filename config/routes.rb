Rails.application.routes.draw do

  root 'home#index'

  devise_for :users
  devise_scope :user do
    get '/creative/sign_up' => 'devise/registrations#new', as: :new_creative, user: {role: 'creative'}
    get '/member/sign_up' => 'devise/registrations#new', as: :new_member, user: {role: 'member'}
    get '/:id' => 'users#show', as: :user
    get '/:id/edit/profile' => 'users#edit_profile', as: :edit_user_profile
    get '/:id/edit/profile/remove_avatar' => 'users#remove_avatar', as: :remove_user_avatar

    get '/:id/portfolio' => 'users#portfolio', as: :user_portfolio
    get '/:id/experience' => 'users#experience', as: :user_experience
    get '/:id/favorites' => 'users#favorites', as: :user_favorites
    get '/:id/followers' => 'users#followers', as: :user_followers
    get '/:id/following' => 'users#following', as: :user_following
    get '/:id/collections' => 'users#collections', as: :user_collections

    get '/creatives' => 'users#creatives_index', as: :creatives_index
    get '/members' => 'users#members_index', as: :members_index
  end

  

  get 'follow/:id' => 'follows#follow', as: :follow_user
  get 'unfollow/:id' => 'follows#unfollow', as: :unfollow_user

  resources :posts
  resources :projects
  resources :collections
  resources :messages
  resources :invites

  resources :comments
  
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
  #     #     resources :sales do
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
