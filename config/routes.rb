Rails.application.routes.draw do
  get '/hello' => 'home#hello'
  get root 'home#index'
end
