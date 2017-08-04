Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # resources :auths, only: :create

  # scope module: 'v1', :constraints => lambda { |request| request.params[:version] == "1" } do
  # api_version(:module => "V1", parameter: {name: "version", value: "1"}) do
  # api_version(module: "V1", header: {name: "X-Version", value: "1"}) do
  api_version(module: "V1", path: {value: "v1"}) do
  # constraints subdomain: 'v1' do
  #   scope module: 'v1' do
      # mount_devise_token_auth_for 'User', at: 'auth'
      resources :address
      resources :phones
      resources :contacts do
        resource :kinds, only: :show
        resource :kinds, only: :show, path: 'relationships/kind'

        resource :address, only: [:show, :create, :update, :destroy]
        resource :address, only: [:show, :create, :update, :destroy], path: 'relationships/address'

        resource :phones, only: :show
        resource :phone, only: [:create, :update, :destroy]
        resource :phones, only: :show, path: 'relationships/phones'
        resource :phone, only: [:create, :update, :destroy], path: 'relationships/phones'
      # end
    end
  end

  # scope module: 'v2', :constraints => lambda { |request| request.params[:version] == "1" } do
  # api_version(:module => "V2", parameter: {name: "version", value: "2"}) do
  # api_version(module: "V2", header: {name: "X-Version", value: "2"}) do
  api_version(module: "V2", path: {value: "v2"}) do
  # constraints subdomain: 'v2' do
  #   scope module: 'v1' do
      # mount_devise_token_auth_for 'User', at: 'auth'
      resources :address
      resources :phones
      resources :contacts do
        resource :kinds, only: :show
        resource :kinds, only: :show, path: 'relationships/kind'

        resource :address, only: [:show, :create, :update, :destroy]
        resource :address, only: [:show, :create, :update, :destroy], path: 'relationships/address'

        resource :phones, only: :show
        resource :phone, only: [:create, :update, :destroy]
        resource :phones, only: :show, path: 'relationships/phones'
        resource :phone, only: [:create, :update, :destroy], path: 'relationships/phones'
      end
    # end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
