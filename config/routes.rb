Rails.application.routes.draw do

  scope :api, defaults: { format: :json } do
    get 'events', to: 'events#index'
    get 'events/event_analytics', to: 'events#event_analytics'
    post 'events', to: 'events#create'
    put 'events', to: 'events#update'
    get 'events/:id', to: 'events#show'
    post 'events/add_view', to: 'events#add_view'
    post 'events/add_vote', to: 'events#add_vote'
    post 'events/remove_vote', to: 'events#remove_vote'
    devise_for :users, controllers: { sessions: :sessions },
    path_names: { sign_in: :login }
    resource :users, only: [:show, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
