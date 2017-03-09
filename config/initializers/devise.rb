Devise.setup do |config|
  config.secret_key = '8c461916f1c934c4ffce565f44bb177114b0b35ed151401e97d613fde316b1cbea8a92be992f8fd8e2e70027029409618c42487fccc5f14b630a7b6c0e014efe'
  config.mailer_sender = 'noreply@librex.co.jp'

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
  config.omniauth :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET']
  
end
