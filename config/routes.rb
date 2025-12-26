Rails.application.routes.draw do
  # Οι διαδρομές για την αυθεντικοποίηση
  post 'signup', to: 'authentication#signup'
  post 'auth/login', to: 'authentication#login'

  # Οι διαδρομές για τα Todos και τα Items
  resources :todos do
    resources :items
  end
end