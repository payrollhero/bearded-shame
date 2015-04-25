Rails.application.routes.draw do
  mount Shave::API => '/'
  devise_for :users


  authenticated :user do
    root 'application#index', :as => :authenticated_root
    get '*path', to: 'application#index'
  end
  root to: redirect('/users/sign_in')
end
