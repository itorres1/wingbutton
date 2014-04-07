Wingbutton::Application.routes.draw do

  resources :users
  resources :addresses
  resources :orders

  get "/login", to: "session#new"
  post "/session", to: "session#create"
  delete "/session", to: "session#destroy"
  get '/show', to: 'welcome#show'
  get '/wings/:id', to: 'welcome#wings'
  get '/details/:id', to: 'welcome#details'

  root 'welcome#index'
end
