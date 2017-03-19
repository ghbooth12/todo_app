Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [] do
    resources :items, only: :create
  end

  resources :items, only: [] do
    resources :completes, only: [:create, :destroy]

    collection do
      delete 'destroy_multiple'
    end
  end

  get 'users/:id' => 'users#show', as: :user_show
  get 'auto_sign' => 'welcome#auto_sign'

  root 'welcome#index'
end
