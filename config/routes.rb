Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  mount ActionCable.server => "/cable"

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for "User", at: "auth"
      resources :tutor_profiles
      resources :appointments
      resources :listings
      resources :courses do
        resources :reviews, module: :courses
      end
      resources :instructors do
        resources :reviews, module: :instructors
      end
    end
  end
end
