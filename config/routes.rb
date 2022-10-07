Rails.application.routes.draw do
  # get 'users/edit'
  # get 'users/show'
#   get  'books/index'
  # get 'books/show'
  # get 'books/new'
  # get 'homes/top'
  devise_for :users
       root :to => "home#top"
get 'home/about' => 'home#about' , as: 'about'

   resources :books, only:[:index,:show,:edit,:update,:create,:destroy]
   resources :users, only:[:index,:show,:edit,:update,:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # error prohibited this user from being saved:

end
