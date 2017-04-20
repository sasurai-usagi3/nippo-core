NippoCore::Engine.routes.draw do
  devise_for :users, class_name: "NippoCore::User", module: :'nippo_core/users'
  resources :groups, except: [:index, :edit, :update] do
    resources :reports, except: [:edit, :update]
  end
  root 'home#index'
end
