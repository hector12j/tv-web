Rails.application.routes.draw do
  get 'videos/movies'
  get 'videos/seasons'
  post 'stores/purchase'
  get 'store/:user_id', to: 'stores#store'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, :episodes, :videos
end
