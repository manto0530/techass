# Rails.application.routes.draw do
  # resources :details
  # resources :people

  # resources :people do
  #   resources :details
  # end

  Rails.application.routes.draw do
    defaults format: :json do
      resources :people, only: [:index, :show, :create, :update, :destroy] do
        resources :details, only: [:index, :show, :create, :update, :destroy]
      end
    end

    root 'home#index'
    
  end
  
#   root 'home#index'
#   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
# end
