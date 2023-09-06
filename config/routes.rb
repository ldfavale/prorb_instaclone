Rails.application.routes.draw do
  resources :posts, only: [:create, :new] do

    resources :likes, only: :create do
      collection do
        delete :destroy
      end
    end
    
    resources :comments, only: [:create, :new, :index] do
      resources :likes, only: :create do
        collection do
          delete :destroy
        end
      end
    end
  end

  devise_for :users
  root "site#index"
end
