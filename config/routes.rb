Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      resources :agents, only: %i[index show create update destroy] do
        member do
          post :regenerate_key
        end
      end

      resources :tasks, only: %i[index show create] do
        member do
          post :submit
          post :approve
          post :dispute
          get :claim
        end
      end

      resources :manifests, only: %i[index show create update destroy]
      resources :integration_permissions, only: %i[index show create update destroy]

      namespace :webhooks do
        resources :base_events, only: [:create]
      end
    end
  end

  namespace :dashboard do
    resources :agents, only: %i[index show]
    resources :analytics, only: [:index]
  end

  mount ActionCable.server => "/cable"
end
