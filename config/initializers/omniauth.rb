# FACEBOOK_KEY = open("#{Rails.root}/config/initializers/.api_key.rb").read()
# FACEBOOK_SECRET = open("#{Rails.root}/config/initializers/.auth_token.rb").read()

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "#{ENV['FACEBOOK_API_KEY']}", "#{ENV['FACEBOOK_AUTH_TOKEN']}",
  scope: 'email', display: 'popup'
end