Rails.application.routes.draw do
  resources :wizards, only: [:index, :show]
  get 'wizards/:id/*answers_path', to: 'wizards#show', as: :wizard_answers

  get 'hello_world', to: 'hello_world#index'
  get root 'home#index'
end
