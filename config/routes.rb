Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {   registrations: 'users/registrations',
                                    sessions: 'users/sessions' }

  get root to: "homes#top"
  get "home/about" => "homes#about"
  resources :users
  resources :artists, only: [:index, :show, :new, :create]
  resources :musics do
    resource :likes, only: [:create, :destroy]
  end
end
