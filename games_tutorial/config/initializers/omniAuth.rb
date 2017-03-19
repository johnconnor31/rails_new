OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,'1273884366011961','69c88932e52f1210e5442d3db5192b6d'
end