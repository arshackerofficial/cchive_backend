Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  mount ActionCable.server => "/cable"
  visualize groups: [ "development" ]
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for "User", at: "auth"
      resources :tutor_profilesn, only: [ :index, :create ]
      get "tutor_profile", to: "tutor_profiles#my_tutor_profile"
      resources :appointments
      resources :listings
      resources :courses do
        resources :reviews, module: :courses
      end
      resources :instructors do
        resources :reviews, module: :instructors
      end
      resources :study_groups do
        resources :messages
      end
    end
  end
end
