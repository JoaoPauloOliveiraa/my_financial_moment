Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "api/v1/clients#index"
  namespace 'api' do
    namespace 'v1' do
      resources :clients, only: [:index, :create]
    end  
  end
end
