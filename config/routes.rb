Rails.application.routes.draw do
  root :to => 'pages#home'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  patch '/pseudousers/:id' => 'pseudousers#upvote', :as => 'pseudouser'

  resources :users, :only => [:new, :create, :show]
  resources :excerpts, :only => [:new, :create, :show, :edit, :update, :destroy]
  resources :novels, :only => [:new, :create, :show, :edit, :destroy, :update]
end
