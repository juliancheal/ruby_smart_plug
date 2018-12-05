require 'configatron/core'
require 'logger'
module SmartPlug
  Config = Configatron::Store.new

  Config.default_duration = 1
  Config.message_wait_timeout = 3
  Config.message_retry_interval = 0.5
  Config.broadcast_ip = '255.255.255.255'
  Config.allowed_transports = [:udp, :tcp]
  Config.log_invalid_messages = true
  Config.logger = Logger.new(STDERR).tap do |logger|
    logger.level = Logger::WARN
  end
end
