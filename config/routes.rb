Rails.application.routes.draw do

  resources :passwords, controller: 'clearance/passwords', only: [:create, :new]
  resource :session, controller: 'clearance/sessions', only: [:create]

  get '/sign_in' => 'clearance/sessions#new', as: 'sign_in'
  delete '/sign_out' => 'clearance/sessions#destroy', as: 'sign_out'
  get '/sign_up' => 'clearance/users#new', as: 'sign_up'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  localized do
    resources :ships do
      resources :port_of_calls
    end
    resources :ports
    resources :lines
    resources :cruises
    resources :passengers do
      resource :password,
        controller: 'clearance/passwords',
        only: [:create, :edit, :update]
    end
  end
end
