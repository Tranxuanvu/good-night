Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :auths, only: %i[] do
        collection do
          post :login
        end
      end

      post 'users/:id/follow', to: 'follows#create'
      delete 'users/:id/unfollow', to: 'follows#destroy'
    end
  end
end
