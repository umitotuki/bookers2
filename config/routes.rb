Rails.application.routes.draw do
  get 'homes/about' => 'homes#about' , as: 'about'
  devise_for :users
  resources :books, only: [:new, :create, :index, :show, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
end
