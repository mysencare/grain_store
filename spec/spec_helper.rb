$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

Bundler.require(:default, :test)

require 'grain_store'

require 'rspec/its'

GrainStore.configure do |config|
  config.host = '127.0.0.1'
  config.port = 6379
  config.expiry_seconds = 86400*42
  config.engine = :redis
end
