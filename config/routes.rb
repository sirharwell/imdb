Rails.application.routes.draw do
  root 'actors#index'
  resources :actors
  resources :films
end
