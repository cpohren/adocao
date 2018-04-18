Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :animals do 
    resources :file_uploads, only: [:new, :create, :destroy]
  end
end
