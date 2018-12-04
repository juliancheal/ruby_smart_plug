module SmartPlug
  module Logging
    def self.included(mod)
      mod.extend(self)
    end

    def logger
      SmartPlug::Config.logger
    end
  end
end
