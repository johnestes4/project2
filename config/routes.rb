Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#index'
  resources :users
  resource :outbox do
    resources :messages
  end
  resource :inbox do
    resources :messages
  end
  resource :session

end
