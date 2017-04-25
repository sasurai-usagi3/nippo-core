NippoCore::Engine.routes.draw do
  devise_for :users, class_name: "NippoCore::User", module: :'nippo_core/users'
  resource :users, path: :user, only: :show
  resources :groups, except: [:destroy] do
    # resources :users, module: :groups, only: [] do
    # end
    resources :group_member_relations, path: :group_members, only: [:new, :create] do
      get :unaccepted, on: :collection
    end
    resources :reports, except: [:destroy]
    post :request_join
  end
  resources :group_member_relations, path: :group_members, only: [] do
    post :accept
  end

  root 'home#index'
end
