Rails.application.routes.draw do


  get 'faq' => 'faqs#index'

  get 'reportes/ingresos'

  get 'reportes/gauchadas'

  get 'search/:frase' => 'home#search'
  get 'search/:frase/:ciudad' => 'home#search'
  get 'postulacions/cambiar_estado_aceptado' => 'postulacions#cambiar_estado_aceptado'
  get 'postulacions/cambiar_estado_rechazado' => 'postulacions#cambiar_estado_rechazado'
  get 'gauchadas/concretada' => 'gauchadas#cambiar_estado_concretada'
  get 'gauchadas/no_concretada' => 'gauchadas#cambiar_estado_no_concretada'

  devise_for :usuarios, controllers: {
    registrations: 'registrations'
  }
  resources :usuarios, only: [:show]
  resources :answers
  resources :questions
  resources :gauchadas do
      member do
        get :ver_listado
        get :terminar
      end
    end
  resources :logros
  resources :compras
  resources :postulacions

  root 'gauchadas#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
