Rails.application.routes.draw do

  resources :routes

  resources :passwords, controller: 'clearance/passwords', only: [:create, :new]
  resource :session, controller: 'clearance/sessions', only: [:create]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  localized do
    get '/passengers/go_abord' => 'clearance/sessions#new', as: 'sign_in'
    delete '/passengers/go_ashore' => 'clearance/sessions#destroy', as: 'sign_out'
        
    resources :ships do
      resources :port_of_calls
    end
    resources :ports
    resources :lines
    resources :cruises
    resources :passengers, path_names: { new: 'embark' } do
      resource :password,
        controller: 'clearance/passwords',
        only: [:create, :edit, :update]
    end
  end
end
