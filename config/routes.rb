Rails.application.routes.draw do
  get 'static_pages/home'

  get 'static_pages/about'

  get 'static_pages/investment'

  get 'static_pages/studio'

  get 'static_pages/contact'

  get 'static_pages/clients'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
