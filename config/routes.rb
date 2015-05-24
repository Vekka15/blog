Rails.application.routes.draw do
  get '/articles/search', to: 'articles#search'
  devise_for :users
  resources :users
 resources :articles do
 resources :comments
 end
 root "articles#index" #mowimy ze strona i metoda index jest strona glowna
end
