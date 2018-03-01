Rails.application.routes.draw do
  
  root 'posts#index'

  get 'static_pages/about'

  get 'static_pages/contact'

  get 'tags/:tag', to: 'posts#index', as: :tag

  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

