Abietite::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resources :derbies, only: [:index, :show] do
    resources :derby_entries, only: :index
  end

  resources :derby_entries, only: :create

end
