Rails.application.routes.draw do
  resources :wizards, path: 'transitions', only: [:index, :show] do
    resources :results, only: [:index]
  end

  resources :questions, only: [:show] do
    resources :answers, only: [:create]
  end

  # resources :transitions, only: [:index, :show]
  # get 'transitions/:id/*answers_path', to: 'transitions#show', as: :transition_flow
  # post 'transitions/:id', to: 'transitions#answer'
  # post 'transitions/:id/*answers_path', to: 'transitions#answer'
  #
  # get 'transitions/:wizard_id/results/*answers_path', to: 'results#index', as: :results

  get 'hello_world', to: 'hello_world#index'
  get root 'home#index'
end
