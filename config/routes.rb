Rails.application.routes.draw do
  resources :transitions, only: [:index, :show]
  get 'transitions/:id/*answers_path', to: 'transitions#show', as: :transition_flow
  post 'transitions/:id', to: 'transitions#answer'
  post 'transitions/:id/*answers_path', to: 'transitions#answer'

  get 'hello_world', to: 'hello_world#index'
  get root 'home#index'
end
