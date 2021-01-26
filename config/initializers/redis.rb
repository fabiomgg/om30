if Rails.env.production?
  $redis = Redis.new(url: ENV["REDIS_URL"], ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE })
else
  Sidekiq.configure_server do |config|
    config.redis = { password: 'Redis2019!' }
  end
  
  Sidekiq.configure_client do |config|
    config.redis = { password: 'Redis2019!' }
  end
end