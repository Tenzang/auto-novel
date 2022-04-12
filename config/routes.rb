Rails.application.routes.draw do
  get 'excerpts/new'
  get 'excerpts/edit'
  get 'excerpts/show'
  root :to => 'pages#home'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :users, :only => [:new, :create, :show]
  resources :excerpts
end
