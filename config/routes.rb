Rails.application.routes.draw do
  devise_for :users
 resources :articles do
 resources :comments
 end
 root "articles#index" #mowimy ze strona i metoda index jest strona glowna
end
