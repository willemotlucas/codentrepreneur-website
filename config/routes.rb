Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { registrations: 'registrations', sessions: 'sessions' }

  resources :free_project, only: [:show] do 
	   resources :step, only: [:show]
     resources :ratings, only: [:create]
  end

  resources :paid_project, only: [:show] do 
	   resources :step, only: [:show]
     resources :rating, only: [:create]
  end

  root to: "pages#index"

  get "preorder_project/:id" => "preorder_project#show", as: "preorder_project"

  get "myprojects" => "my_projects#index", as: "my_projects"

  get "projects" => "pages#projects", as: "projects"

  get 'my_account' => "my_account#index", as: "my_account"

  post 'preorder_project/:id/payment' => "charges#preorder_project"

  post 'paid_project/:id/payment' => "charges#paid_project"

  post 'referral_code/verify' => "referral#verify_availability"
end
