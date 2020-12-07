Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :dashboard, only: [:show], controller: :dashboard do
    resources :dates, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :packages
  get '/dates', to: 'dates#index', as: 'dates_index'
  get '/dates/:id', to: 'dates#show', as: 'dates_show'
  get '/:activity_type/:activity_id/reviews', to: 'reviews#index', as: 'reviews'
  get '/:activity_type/:activity_id/reviews/new', to: 'reviews#new', as: 'new_review'
  post '/:activity_type/:activity_id/reviews', to: 'reviews#create', as: 'create_review'
  post '/:activity_type/:activity_id/whishlist', to: 'whishlist#create', as: 'create_whishlist'
  delete '/:activity_type/:activity_id/whishlist', to: 'whishlist#destroy', as: 'destroy_whishlist'
end
