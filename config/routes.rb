Rails.application.routes.draw do
  get 'events', to: 'events#index'
  get 'events/event_analytics', to: 'events#event_analytics'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
