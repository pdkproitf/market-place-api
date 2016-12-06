MarketPlaceApi::Application.routes.draw do
 namespace  :api, defaults: { format: :json },
                  constraints: { subdomain: 'api' },
                  path: '/' do
  # We are going to list our resource
 end
end
