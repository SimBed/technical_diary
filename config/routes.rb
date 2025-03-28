Rails.application.routes.draw do
  resources :items do
    collection do
      get "filter"
      get "clear_filters"
    end
  end
  get "up" => "rails/health#show", as: :rails_health_check
  root "items#index"
end
