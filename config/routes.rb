Rails.application.routes.draw do
  resources :notifications
  root 'inicio#index'
  resources :comentarios
  resources :pqrs
  resources :usuarios
  resources :sessions, only: [:new, :create, :destroy]
  resources :dependencia
  resources :rols
  resources :tipodocumentos
  get 'registro', to: 'usuarios#new', as: 'registro'
  get 'iniciarSesion', to: 'sessions#new', as: 'iniciarSesion'
  get 'cerrarSesion', to: 'sessions#destroy', as: 'cerrarSesion'
  post 'nuevaNotificacion', to: 'notifications#nuevaNotificacion'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
