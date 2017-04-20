NippoCore::Engine.routes.draw do
  devise_for :users, class_name: "NippoCore::User", module: :'nippo_core/users'
  root 'home#index'
end
