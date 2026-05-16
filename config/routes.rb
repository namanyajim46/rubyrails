Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
   get "up" => "rails/health#show", as: :rails_health_check
   
   
   root "products#index"

    resources :products do
    resources :subscribers, only: [ :create ]
  end



end
