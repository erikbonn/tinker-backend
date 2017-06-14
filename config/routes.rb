Rails.application.routes.draw do
  resources :users, only: [:show] do
    resources :requests, only: [:new, :create, :show, :index, :edit, :update] do
      resources :comments, only: [:new, :create, :show, :index, :edit, :update]
    end
    resources :user_requests, only: [:index]
  end

  resources :users, only: [:show, :create] do
    resources :profile_photo, only: [:new, :create, :show, :index]
  end



  post 'authenticate', to: 'authentication#authenticate'

  get "/privacy-policy" => "policy#index"
  get "/ig/callback" => "callback#index"

end
