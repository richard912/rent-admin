Rails.application.routes.draw do

  root :to => 'dashboards#index'
  devise_for :agents

  resources :agents do
    collection do
      post :index 
      post :cnew
      post :search
      post :activate_agent
    end
  end    

  resources :listings do
    collection do
      post :search
      post :activate_listing
    end
  end

  resources :users do
    collection do
      post :index
      post :activate_user
    end
  end
end
