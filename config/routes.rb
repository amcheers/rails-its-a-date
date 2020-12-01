Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :dashboard, only: [:show] do
    resources :dates, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :packages, only: [:index, :show, :edit, :update]
  get '/dates', to: 'dates#index', as: 'dates_index'
  get '/dates/:id', to: 'dates#show', as: 'dates_show'
  get '/activity_type/:activity_id/reviews', to: 'reviews#index'
  get '/activity_type/:activity_id/reviews/new', to: 'reviews#new'
  post '/activity_type/:activity_id/reviews', to: 'reviews#create'
  post '/activity_type/:activity_id/whishlist', to: 'whishlist#create'
  delete '/activity_type/:activity_id/whishlist', to: 'whishlist#destroy'
end
