Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/cards',    to: 'static_pages#cards'
  get  '/raidrank',   to: 'static_pages#raidrank'
  get  '/link',   to: 'static_pages#link'
  get  '/contact', to: 'static_pages#contact'
  get  '/optimiser', to: 'static_pages#optimiser'
  get  '/optimiser2', to: 'static_pages#optimiser2'
  post '/optimise',   to: 'static_pages#optimise'
  post '/optimise2',   to: 'static_pages#optimise2'
  post '/optimise3',   to: 'static_pages#optimise3'
  post '/optimise4',   to: 'static_pages#optimise4'
  post '/export',   to: 'static_pages#export'


end
