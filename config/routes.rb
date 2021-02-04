Rails.application.routes.draw do
  get 'events/new'
  get 'events/create'
  get 'events/show'
  get 'events/index'
  resources :users, except:[:destroy, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#new'
end
