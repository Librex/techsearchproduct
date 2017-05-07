Devise.setup do |config|
  config.secret_key = '9145b36e3d710f11312bb79b37684e45907029c322974fbe3e42ca9cf41af9e1e045b88a8b96bd93bd5a957f53046341e72a06007779ed5990be8d19408b74dd'
  config.mailer_sender = 'noreply@wiredgate.co.jp'

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10

  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 8..72
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete

  require 'omniauth-facebook'
  
  if Rails.env.production?
    config.omniauth :facebook, ENV["FACEBOOK_ID_PRODUCTION"], ENV["FACEBOOK_SECRET_PRODUCTION"], scope: 'email', display: 'popup', info_fields: 'name, email'
  else
    config.omniauth :facebook, ENV["FACEBOOK_ID_DEVELOPMENT"], ENV["FACEBOOK_SECRET_DEVELOPMENT"], scope: 'email', display: 'popup', info_fields: 'name, email'
  end
end
