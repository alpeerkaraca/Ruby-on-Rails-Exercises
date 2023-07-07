Rails.application.routes.draw do
  root 'pages#home'
  get 'about' => 'pages#about'
  resources :articles,  only: [:show, :index, :create, :new, :edit, :update] #cause of we are using all of capabilities of CRUD will use just resoruces :articles thats how we get all
  delete 'articles/:id' => 'articles#destroy', as: :delete_article #this is how we get delete route
end
