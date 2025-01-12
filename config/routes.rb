Rails.application.routes.draw do
  root "pages#index"

  resources :pages do
    resource :check, only: [:create]
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
