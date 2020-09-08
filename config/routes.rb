Rails.application.routes.draw do
  #SERIES

  #CREATE
  get 'series/new', to: 'series#new' #--> to: 'controlador#acción'
  post 'series', to: 'series#create'

  #READ
  root to: 'series#index' #Atajo para dejar el index como pagina de inicio.
  get 'series/index', to: 'series#index'
  get 'series/:id', to: 'series#show', as: 'serie'

  #UPDATE
  get 'series/:id/edit', to: 'series#edit', as: :serie_edit
  patch 'series/:id/', to: 'series#update', as: 'serie_update'

  #DELETE
  delete 'series/:id', to: 'series#destroy'

end
