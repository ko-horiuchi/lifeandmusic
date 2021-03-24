Rails.application.routes.draw do
  # devise_for :admins, path: 'admin', controllers: {
  # sessions: 'admins/sessions'
  # }

  devise_for :users, controllers: {
     registrations: 'users/registrations',
     sessions: 'users/sessions'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    get root to: "homes#top"
    resources :musics
    resources :users
    resources :artists
  end

  scope module: 'user' do
    get root to: "homes#top"
    get "home/about" => "homes#about"
    resources :users do
      collection do
        get :likes
      end
    end

    resources :artists, only: [:index, :show, :new, :create]
    resources :musics do
      resource :likes, only: [:create, :destroy]
      resource :comments, only: [:create, :destroy]
    end
    resources :videos
  end
end