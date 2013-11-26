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
          get :cobrar
          post :efectivizar_cobro
      end
      resources :clients
      resources :suppliers
      resources :laboratories
      resources :products do
         get :edit_attributes
         
         post :save_attributes
         
         collection do
           get :actualizar
         end
      end
      resources :stocks
      resources :users 
      resources :expenses
      resources :balances
      match "actualizar_stock" => "stocks#update_stock"
      
      match "modificar_stock/:stock_id" => "stocks#modificar_stock", :as => "modificar_stock"
      
      match "new_actualizar_stock/:product_id" => "stocks#actualizar_stock", :as => "new_actualizar_stock"
      
      match 'filtrar_stock/:branch_id/' => "stocks#filtrar_stock", :as => "filtrar_stock"
      
      match "selected_branch/:branch_id" => "branches#selected_branch", :as => "selected_branch"

       match 'import_products' => "products#import", :as => "import_products"
       match 'save_import_products' => "products#save_import", :as => "save_import_products"
      

  end       
         
  resources  :user_sessions
  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout    
  root :to => "branches#index"
  match "elegir_branch" => "branches#elegir_branch", :as => "elegir_branch"
  match "caja_tipo_movimientos/:tipo" => "balances#filtrar_movimientos", :as => "filtrar_movimientos"
  match "actualizar_atributos/:branch_id/:product_id/:stock_id" => "products#actualizar_atributos", :as => "actualizar_atributos"
  match 'download_products/:branch_id/' => "products#download", :as => "download_products"
  match 'download_accounts/:branch_id/' => "accounts#download", :as => "download_accounts"
  match 'download_balance/:branch_id/' => "balances#download", :as => "download_balances"
  match 'download_expense/:branch_id/' => "expenses#download", :as => "download_expenses"
  
  match 'import_products' => "products#import", :as => "import_products"
  match 'save_import_products' => "products#save_import", :as => "save_import_products"
  
  
  

end
