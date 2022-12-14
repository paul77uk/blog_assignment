Rails.application.routes.draw do
  get 'dashboards/index', as: :dashboards
  resources :logins, only: %i[new create]
  resources :registrations, only: %i[new create]

  resources :users do
    resources :posts
  end
end
