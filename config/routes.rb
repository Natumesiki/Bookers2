Rails.application.routes.draw do
  # get 'users/edit'
  # get 'users/show'
  # get 'books/index'
  # get 'books/show'
  # get 'books/new'
  # get 'homes/top'
  devise_for :users
       root :to => "homes#top"
get '/homes/about' => 'homes#about' , as: 'about'
   resources :books, only:[:new,:index,:show]
   resources :users, only:[:show,:edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
