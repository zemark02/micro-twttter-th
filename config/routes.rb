Rails.application.routes.draw do
  resources :posts
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'destroy_all' ,to: 'users#destroy_all'
  root to: "main#login"
  get 'main' ,to: 'main#login'
  post 'login' ,to: 'users#login'
  get "feed/:id" ,to: "users#feed"
  get "profile/:name" ,to:"users#profile"
  get "/updateprofile/:name" ,to: "users#profileUpdate"
  get "/like/:postID" ,to: "users#likeUpdate"
  post "setFollow" , to: "users#profileUpdate"
  post "setLike" , to:"users#likeUpdate" , as: :like #as for set prefix url
  get "/search" , to:"users#search"
  post "createPost" , to: "posts#createPost"
  post "createComment" , to:"comments#create"
  delete "destroy" , to:"comments#destroy"
  patch "/comments/:id" ,to:"comments#update"

  post "updatelike" , to:"comments#updateLike" ,as: :updateLikeComment
end
