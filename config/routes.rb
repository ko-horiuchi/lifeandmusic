Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {   registrations: 'users/registrations',
                                    sessions: 'users/sessions' }

  get root to: "homes#top"
  get "home/about" => "homes#about"
  resources :users, only: [:show, :edit, :update]
  resources :artists, only: [:index, :show, :new, :create]
  resources :musics, only: [:index, :new, :create, :show, :edit, :update]
end
