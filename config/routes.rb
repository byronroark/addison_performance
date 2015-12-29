Rails.application.routes.draw do
  devise_for :admins

  root 'pages#home'
  get '/about', to: 'pages#about', as: :about
  get '/contact_us', to: 'pages#contact', as: :contact
  get '/services', to: 'pages#services', as: :services
  get '/admins/sign_in', to: 'devise/sessions#new', as: :login

  resources :work_orders
end
