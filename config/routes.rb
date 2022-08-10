Rails.application.routes.draw do
  resources :merchants, only: [:index, :create] do
    resources :items, only: [:index, :show, :edit, :update, :new, :create]
  end


  get '/merchants/:merchant_id/invoices', to: 'merchant_invoices#index'
  get '/merchants/:merchant_id/invoices/:id', to: 'merchant_invoices#show'
  post '/merchants/:merchant_id/invoices/:id', to: 'merchant_invoices#update'
  get '/merchants/:merchant_id/dashboard', to: 'merchants#show'

  get '/merchants/:merchant_id/discounts', to: 'discounts#index'
  get '/merchants/:merchant_id/discounts/new', to: 'discounts#new'
  post "/merchants/:merchant_id/discounts", to:'discounts#create'
  get "/merchants/:merchant_id/discounts/:id", to:'discounts#show'
  get "/merchants/:merchant_id/discounts/:id/edit", to:'discounts#edit'
  patch '/merchants/:merchant_id/discounts/:id', to: 'discounts#update'
  delete "/merchants/:merchant_id/discounts/:id", to:'discounts#destroy'

  get '/admin', to: 'admin#dashboard'

  get '/admin/invoices', to: 'admin#index'
  get '/admin/invoices/:id', to: 'admin#show'
  patch '/admin/invoices/:id/update', to: 'admin#update'

  get '/admin/merchants/new', to: 'admin#new'
  get '/admin/merchants', to: 'admin_merchants#index'
  get '/admin/merchants/:merchant_id', to: 'admin_merchants#show'
  get '/admin/merchants/:merchant_id/edit', to: 'admin_merchants#edit'
  patch '/admin/merchants/:merchant_id/update', to: 'admin_merchants#update'
  patch '/admin/merchants/:merchant_id/update-status', to: 'admin_merchants#update'
  post '/admin/merchants', to: 'admin_merchants#create'
end
