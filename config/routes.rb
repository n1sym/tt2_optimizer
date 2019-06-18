Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/cards',    to: 'static_pages#cards'
  get  '/raidrank',   to: 'static_pages#raidrank'
  get  '/link',   to: 'static_pages#link'
  get  '/contact', to: 'static_pages#contact'
  get  '/optimiser', to: 'static_pages#optimiser'
  post '/optimise',   to: 'static_pages#optimise'

end
