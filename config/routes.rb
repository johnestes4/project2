Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#landing'
  resources :users
  resource :outbox do
    resources :messages
  end
  resource :inbox do
    resources :messages
  end
  resource :session
  get '/users/:id/conversation', to: 'users#conversation'


end
