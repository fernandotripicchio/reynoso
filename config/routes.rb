Profe::Application.routes.draw do
  
  resources :accounts


  resources :sales do
    collection do 
      get :reportes
    end
  end
  resources :clients do
      # get :cuenta_corriente
      # collection do
         # get :cuentas_corrientes
      # end
  end
  resources :branches
  resources :suppliers
  resources :products
  resources :stocks 
  match "actualizar_stock" => "stocks#update_stock"
  match 'filtrar_stock/:branch_id/' => "stocks#filtrar_stock", :as => "filtrar_stock"
         
         

  resources :users, :user_sessions
  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout    
  root :to => "branches#index"
end
