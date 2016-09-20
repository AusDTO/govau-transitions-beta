Rails.application.routes.draw do
  resources :wizards, path: 'transitions', only: [:index, :show] do
    resources :result_categories, path: 'results', only: [:index, :show]
  end

  resources :questions, only: [:show] do
    resources :answers, only: [:create]
  end

  get 'hello_world', to: 'hello_world#index'
  get root 'home#index'
end
