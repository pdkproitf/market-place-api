# Use this module to configure the sabisu available options

SabisuRails.setup do |config|
  config.base_api_uri = 'localhost:3000'
  config.api_headers = { "Accept" => "application/vnd.marketplace.v1" }
  config.resources = [:users]
end
