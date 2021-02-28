Rails.application.routes.draw do
  resources :activities do
    collection do
      get :all
    end
  end
  root 'activities#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
