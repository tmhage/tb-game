Rails.application.routes.draw do
  get 'pages/home'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  authenticated :user do
    root :to => 'pages#home', :as => :authenticated_root
  end
  !authenticated :user do
    redirect('/users/sign_in')
  end

  root :to => redirect('/users/sign_in')

  get '/characters/edit', to: 'characters#edit', :as => :edit_char
  get '/petty_crime', to: 'pages#pretty_crime', :as =>:petty_crime

  resources :characters, only:[:show,:new,:create,:update]
end
