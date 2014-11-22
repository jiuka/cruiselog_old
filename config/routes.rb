Rails.application.routes.draw do

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
    resources :cruises, only: [:index, :create] do
      resources :cruise_segments, only: [:index, :create], path: 'segments'
      resources :cruise_segments, except: [:index, :create], path: '', path_names: { new: 'add'}
    end
  end
end
