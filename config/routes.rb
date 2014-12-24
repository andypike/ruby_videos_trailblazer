Rails.application.routes.draw do
  root "home#show"

  resource :session
  resources :videos

  get "/auth/:provider/callback", :to => "sessions#create"
end
