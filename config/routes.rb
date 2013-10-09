Profe::Application.routes.draw do
  #Under the branches spaces
  resources :branches do
      collection do
        get :pick
      end
      resources :accounts  
      resources :sales do
          collection do 
             get :reportes
          end
      end
      resources :clients
      resources :suppliers
      resources :products do
         get :edit_attributes
         post :save_attributes
      end
      resources :stocks 
      match "actualizar_stock" => "stocks#update_stock"
      match 'filtrar_stock/:branch_id/' => "stocks#filtrar_stock", :as => "filtrar_stock"
      match "selected_branch/:branch_id" => "branches#selected_branch", :as => "selected_branch"
      
      
  end       
         
  resources :users, :user_sessions
  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout    
  root :to => "branches#index"
  match "elegir_branch" => "branches#elegir_branch", :as => "elegir_branch"
  match "actualizar_atributos/:branch_id/:product_id/:stock_id" => "products#actualizar_atributos", :as => "actualizar_atributos"

end
