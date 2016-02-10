Rails.application.config.middleware.use OmniAuth::Builder do
  provider :headquarters, ENV["HQ_APP_ID"], ENV["HQ_APP_SECRET"],
           request_path: "/auth/headquarters",
           callback_path: "/auth/headquarters/callback"
end
