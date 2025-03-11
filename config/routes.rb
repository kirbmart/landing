Rails.application.routes.draw do
  # Landing page as root
  root "landing#index"
  
  # Leads routes
  resources :leads, only: [:create]
  get "confirmation" => "leads#confirmation", as: :confirmation
  
  # Static files
  get "/favicon.ico", to: redirect("/favicon.ico")
  get "/apple-touch-icon.png", to: redirect("/apple-touch-icon.png")
  get "/apple-touch-icon-precomposed.png", to: redirect("/apple-touch-icon.png")
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
