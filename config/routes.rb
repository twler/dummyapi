DummyApi::Application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:index, :show]
      resources :items, only: [:index, :show]
    end
  end
  
  root to: "static#root"
end
