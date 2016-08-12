Rails.application.routes.draw do
  resources :transitions, only: [:index, :show]
  get 'transitions/:id/*answers_path', to: 'transitions#show',
    as: :transition_with_answers

  get 'hello_world', to: 'hello_world#index'
  get root 'home#index'
end
