Rails.application.routes.draw do
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get '/cities_by_state', to: 'admin/parks#cities_by_state'
  #match "/cities_by_state", to: 'admin/parks#cities_by_state', via: [:get]
end
