Rails.application.routes.draw do
  devise_for :admins, class_name: "Admin::Admin"

  devise_for :customers, class_name: "Public::Customer", :controllers => {
    :sessions => 'customers/sessions',
    :registrations => 'customers/registrations',
   }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'public/products#top'
  get 'about' => 'public/products#about'

  resources :products, only: [:show, :index, :top, :about]
  resources :customers, only: [:show, :withdraw, :out, :edit, :update]
  resources :cart_items, only: [:destroy_all, :destroy, :create, :update, :index]
  resources :orders,only: [:new,:index,:show,:create] do
    collection do
    post 'check'
    get 'complete'
    end
   end

  resources :deliverys, only: [:create, :index, :destroy, :edit, :update]

  namespace :admin do
    resources :orders, only: [:show, :update, :top]
    resources :ordered_products, only: [:update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :products, except: [:destroy]
    resources :genres, except: [:destroy]
    resources :searches, only: [:search]
  end


end
