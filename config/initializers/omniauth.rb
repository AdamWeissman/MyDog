Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"], {
        :name => "google",
        :scope => ['profile', 'email'],
        :prompt => "select_account",
        :image_aspect_ratio => "square",
        :image_size => 50,
        :access_type => 'offline'
    }

    OmniAuth.config.on_failure = SessionsController.action(:welcome)

end