Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
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
