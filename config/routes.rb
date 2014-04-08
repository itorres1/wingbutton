Wingbutton::Application.routes.draw do

  resources :users
  resources :addresses
  resources :orders

  root 'welcome#index'

  #login / session routes
  get "/login", to: "session#new"
  post "/session", to: "session#create"
  delete "/session", to: "session#destroy"

  #guest routes
  get 'guest/wings/:id', to: 'guest#wings'
  get 'guest/menu/:id', to: 'guest#menu'
  get 'guest/confirmation', to: 'guest#confirmation'
  get 'guest/order', to: 'guest#order'

  
end
