Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  localized do
    resources :ships
    resources :ports
    resources :lines
    resources :cruises do
      resources :cruise_segments, path: 'segments'
    end
  end
end
