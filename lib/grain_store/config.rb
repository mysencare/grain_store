module GrainStore
  def self.host
    self.configuration.host
  end

  def self.port
    self.configuration.port
  end

  def self.expiry_seconds
    self.configuration.expiry_seconds
  end

  def self.engine
    self.configuration.engine
  end

  class Config
    attr_accessor :host, :port, :expiry_seconds, :engine

    def setup
      yield self
    end
  end

  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= Config.new
      yield(configuration)
    end
  end
end
