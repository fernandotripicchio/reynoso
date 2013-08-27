Profe::Application.routes.draw do
  resources :suppliers


  resources :products


  resources :users, :user_sessions
  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout    
  root :to => "products#index"
  
  resources :afiliados
  
end
