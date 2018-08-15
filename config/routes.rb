Rails.application.routes.draw do
  root 'films#index'

  resources :films do
    resources :actors 
  end

  scope 'actors/:actor_id', as: 'actor' do
    resources :comments, only: [:new, :create]
  end

end
