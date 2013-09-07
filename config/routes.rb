Profe::Application.routes.draw do
  
  resources :sales


  resources :clients


  resources :branches
  resources :suppliers
  resources :products
  resources :stocks 
  match "actualizar_stock" => "stocks#update_stock"
  resources :users, :user_sessions
  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout    
  root :to => "products#index"
  
  resources :afiliados
  
end
