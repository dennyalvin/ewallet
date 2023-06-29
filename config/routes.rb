Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  namespace :api do
    post '/login', to: 'auth#login'

    post '/deposit', to: 'transaction#deposit'
    post '/withdraw', to: 'transaction#withdraw'
    post '/transfer', to: 'transaction#transfer'

    scope 'user' do
      get '/balance', to: 'user#balance'
    end
  end
end
