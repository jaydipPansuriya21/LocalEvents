Rails.application.routes.draw do

  scope :api, defaults: { format: :json } do
    
    match '/:controller(/:action(:id(.:formate)))', via: [:get, :post, :put]

    # get 'events/get_image', to: 'events#get_image'
    # get 'events', to: 'events#index'
    # get 'events/event_analytics', to: 'events#event_analytics'
    # post 'events', to: 'events#create'
    # put 'events', to: 'events#update'
    # get 'events/:id', to: 'events#show'
    # post 'events/add_view', to: 'events#add_view'
    # post 'events/update_vote', to: 'events#update_vote'
    # post 'images/upload_image', to: 'images#upload_image'
    # post 'images/remove_image', to: 'images#remove_image'
    # post 'vote_infos/user_vote_type', to: 'vote_infos#user_vote_type'
    
    devise_for :users, controllers: { sessions: :sessions },
    path_names: { sign_in: :login }
    resource :users, only: [:show, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
