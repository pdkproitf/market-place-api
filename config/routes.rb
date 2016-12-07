require 'api_constraints'

MarketPlaceApi::Application.routes.draw do
  devise_for :users
  mount GrapeSwaggerRails::Engine => '/swagger'
  # Api definition
  namespace :api, defaults: { format: :json },
                              constraints: { subdomain: 'api' }, path: '/'  do
    scope module: :v1,
              constraints: ApiConstraints.new(version: 1, default: true) do
      # We are going to list our resources here
      resources :users, :only => [:show, :create, :update, :destroy]
      resources :sessions, only: [:create, :destroy]
    end
  end
end
