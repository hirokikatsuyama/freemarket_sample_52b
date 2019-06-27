# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :google_oauth2, ENV['GOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
#   provider :google_oauth2,
#   Rails.application.credentials.google_oauth2[:key],
#   Rails.application.credentials.google_oauth2[:secret]
# end
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
  provider :facebook, ENV['FACEBOOK_CLIENT_ID'], ENV['FACEBOOK_CLIENT_SECRET']
end