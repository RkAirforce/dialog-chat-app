Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations',
        sessions: 'api/v1/auth/sessions'
      }
      resources :posts, only: %i[index create]
      resources :users, only: %i[show]
      get :logged_in, param: :uid, to: "logged_in#show"
    end
  end
end
