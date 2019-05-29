Rails.application.routes.draw do

  devise_for :users

  resources :books

  root "books#top"

  get  "/home/about" => "books#about", as: "about"

   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :users, only: [:show, :index, :edit, :update, :create]

end
