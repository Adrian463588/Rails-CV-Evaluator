Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # Upload endpoints
      post "/upload", to: "documents#upload"
      
      # Evaluation endpoints
      post "/evaluate", to: "evaluations#create"
      get "/result/:id", to: "evaluations#show"
      
      # Admin endpoints (optional)
      namespace :admin do
        resources :ground_truths, only: [:index, :create]
      end
    end
  end

  # Health check
  get "/health", to: "health#check"
end
