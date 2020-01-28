Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/cards',    to: 'static_pages#cards'
  get  '/raidrank',   to: 'static_pages#raidrank'
  get  '/convert',   to: 'static_pages#convert'
  get  '/link',   to: 'static_pages#link'
  get  '/contact', to: 'static_pages#contact'
  get  '/optimiser', to: 'static_pages#optimiser'
  get  '/optimiser2', to: 'static_pages#optimiser2'
  get  '/raidcalc', to: 'static_pages#raidcalc'
  post '/optimise',   to: 'static_pages#optimise'
  post '/optimise2',   to: 'static_pages#optimise2'
  post '/optimise3',   to: 'static_pages#optimise3'
  post '/optimise4',   to: 'static_pages#optimise4'
  post '/raidcalcpost',   to: 'static_pages#raidcalcpost'
  post '/converter',   to: 'static_pages#converter'
  post '/converter2',   to: 'static_pages#converter2'
  post '/export',   to: 'static_pages#export'


end
