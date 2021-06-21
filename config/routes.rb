Rails.application.routes.draw do
  devise_for :admins, :controllers => {
    :sessions => 'admins/sessions'
  }

  devise_for :customers, :controllers => {
    :sessions => 'customers/sessions',
    :registrations => 'customers/registrations',
   }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'public/products#top'
  get 'about' => 'public/products#about'

  scope module: :public do
    resources :products, only: [:show, :index, :top, :about]
    get 'customer/edit' => 'customers#edit'
    put 'customer' => 'customers#update'

    resource :customers, only: [:show] do
      collection do
        get 'withdraw'
        patch 'out'
      end
    end

    resources :cart_items, only: [:destroy_all, :destroy, :create, :update, :index]
    resources :orders,only: [:new,:index,:show,:create] do
      collection do
        post 'check'
        get 'complete'
      end
     end

    resources :deliveries, only: [:create, :index, :destroy, :edit, :update]

  end


  namespace :admin do
    resources :orders, only: [:show, :update, :top]
    get 'orders' => 'orders#top'
    resources :ordered_products, only: [:update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :products, except: [:destroy]
    resources :genres, except: [:destroy]
    resources :searches, only: [:search]
  end


end
