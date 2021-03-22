Rails.application.routes.draw do
  devise_for :admins, path: 'admin', controllers: {
   sessions: 'admins/sessions'
  }

  devise_for :users, controllers: {
     registrations: 'userss/registrations',
     sessions: 'userss/sessions'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  namespace :admin do
    get root to: "homes#top"
  end
  
  scope module: 'user' do
    get root to: "homes#top"
    get "home/about" => "homes#about"
    resources :users
    resources :artists, only: [:index, :show, :new, :create]
    resources :musics do
      resource :likes, only: [:create, :destroy]
      resource :comments, only: [:create, :destroy]
    end
  end
end
