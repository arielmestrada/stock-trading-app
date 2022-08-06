IEX::Api.configure do |config|
    config.publishable_token = 'pk_ca0d6e130f2d481b9601152b34fac344' # defaults to ENV['IEX_API_PUBLISHABLE_TOKEN']
    config.secret_token = 'sk_dd149e6bdd394cce87ef54429a3e7282' # defaults to ENV['IEX_API_SECRET_TOKEN']
    config.endpoint = 'https://cloud.iexapis.com/v1' # use 'https://sandbox.iexapis.com/v1' for Sandbox
end