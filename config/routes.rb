Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "landing#index"
  
  resources :animals do 
    collection do 
      post :contact
      get :mine
    end
    resources :file_uploads, only: [:new, :create, :destroy]
  end
end
