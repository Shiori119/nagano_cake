Rails.application.routes.draw do
  devise_for :customers
  namespace :admin do
    resources :sessions, only: [:new, :create, :destroy]
    resources :items
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :orders_details, only: [:update]
    get '' => 'homes#top', as: 'admin'
  end

  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about', as: 'about'
    resources :items, only: [:index, :show,]
    resources :registrations, only: [:new, :create]
    resources :sessions, only: [:new, :create, :destroy]

    resources :customers, only: [:show, :edit, :update] do
      collection do
        get 'hide'
        patch 'out'
      end
    end

    resources :cart_items, only: [:index, :update, :destroy, :create] do
      collection do
        delete 'destroy_all'
      end
    end

    resources :orders, only: [:new, :show, :create, :index] do
      collection do
        get 'comp'
      end
    end

    resources :addresses, only: [:index, :edit, :create, :update, :destroy]

  end
end
