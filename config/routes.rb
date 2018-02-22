Rails.application.routes.draw do
  
  root 'posts#index'

  get 'static_pages/about'

  get 'static_pages/contact'

  get 'posts/index'

  

  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

