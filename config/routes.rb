Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "", to: "memes#show"
  get "signup", to: "users#signup"
  post "signup", to: "users#create"
  get "login", to: "users#login"
  post "login", to: "users#validate"
  get "logout", to: "users#logout"
  get "dashboard", to: "memes#showd"
  post "dashboard", to: "memes#create"
end
