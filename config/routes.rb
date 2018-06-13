Rails.application.routes.draw do
  resources :bounties, only: [:new, :create, :show]
  root to: 'bounties#new'
end
