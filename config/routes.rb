Rails.application.routes.draw do
  devise_for :users

  resources :free_project do 
	resources :step, only: [:show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#index"

  get "preorder_project/:id" => "preorder_project#show", as: "preorder_project"

  #get "free_project/:id" => "free_project#show", as: "free_project"

  #get "step/:id" => "step#show", as: "step"
end
