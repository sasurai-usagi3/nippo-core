NippoCore::Engine.routes.draw do
  devise_for :users, class_name: "NippoCore::User", module: :'nippo_core/users'

  resources :groups, except: [:index, :edit, :update] do
    resources :group_member_relations, path: :group_members, only: [:new, :create]
    resources :reports, except: [:edit, :update]
  end

  root 'home#index'
end
