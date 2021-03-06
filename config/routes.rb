Rails.application.routes.draw do
  resources :attendances, only:[:new, :create, :destroy]
  resources :sessions, only:[:new, :create, :destroy]
  resources :events, except:[:edit, :destroy]
  resources :users, except:[:destroy, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'events#index'
end
