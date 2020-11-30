Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :dashboard, only: [:index] do
    resources :dates, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :packages, only: [:index, :show, :edit, :update]
  get '/dates', to: 'dates#index', as: 'dates_index'
  get '/dates/:id', to: 'dates#show', as: 'dates_show'
end
