Rails.application.routes.draw do
  get 'workers/index'

  resources :employers, only: :index do
    member do
      post :hire, as: :hire_worker
      post :unhire, as: :unhire_worker
    end
  end

  resources :workers do
    post :choose_talent, on: :member
  end

  get 'site/index'

  devise_for :users

  root 'site#index'
  resources :users do
    member do
      get 'trim'
      get 'massage_and_trim'
      get 'shave'
    end
  end

end
