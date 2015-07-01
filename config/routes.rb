require Rails.root.join 'config/routes/admin'
Rails.application.routes.draw do
  devise_for :users
  root 'home#index'  
  get 'home' => 'home#index'
  resources :home
  resources :ideas
end
