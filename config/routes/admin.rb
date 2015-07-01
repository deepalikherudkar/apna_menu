Rails.application.routes.draw do
  namespace :admin do
    resources :menu
  end
end
