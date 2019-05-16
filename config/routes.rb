Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/cards'
  get 'static_pages/raidrank'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static_pages#home'

end
