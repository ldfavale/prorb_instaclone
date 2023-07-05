Rails.application.routes.draw do
  resources :posts, only: [:create, :new] do
    resources :likes, only: :create, module: :posts do
      collection do
        delete :destroy
      end
    end
    resources :comments, only: [:create, :new] do
      resources :likes, only: :create , module: :comments do
        collection do
          delete :destroy
        end
      end
    end
    
  end
  
  devise_for :users
  root "site#index"
end
