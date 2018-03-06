Rails.application.routes.draw do
  
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }
  resources :users
  root 'posts#index'

  get 'static_pages/about'

  get 'static_pages/contact'

  get 'tags/:tag', to: 'posts#index', as: :tag

  resources :posts do
  	resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

