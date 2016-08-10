Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  resources :free_project, only: [:show] do 
	resources :step, only: [:show]
  end

  resources :paid_project, only: [:show] do 
	resources :step, only: [:show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#index"

  get "preorder_project/:id" => "preorder_project#show", as: "preorder_project"

  get "myprojects" => "my_projects#index", as: "my_projects"

  #get "free_project/:id" => "free_project#show", as: "free_project"

  #get "step/:id" => "step#show", as: "step"
end
