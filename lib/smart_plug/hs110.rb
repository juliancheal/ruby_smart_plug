require 'base64'
require 'json'

module SmartPlug
  class HS110
    def initialize(ip_address, port)
      @ip_address = ip_address
      @port       = port
      @util       = Util.new
    end

    def on
      @util.send(@ip_address, @port, encrypt(SmartPlug::SystemCommands::Turn_on))
    end

    def off
      @util.send(@ip_address, @port, encrypt(SmartPlug::SystemCommands::Turn_off))
    end

    def system_info
      command = encrypt(SmartPlug::SystemCommands::System_info.to_json)
      decrypt(@util.send(@ip_address, @port, command))
    end

    def night_mode
      @util.send(@ip_address, @port, encrypt(SmartPlug::SystemCommands::Turn_off_led))
    end

    def disable_night_mode
      @util.send(@ip_address, @port, encrypt(SmartPlug::SystemCommands::Turn_on_led))
    end

    def device_icon
      @util.send(@ip_address, @port, encrypt(SmartPlug::SystemCommands::Device_icon))
    end

    def parse_response
    end

    private

    def encrypt(payload)
      output = []
      key = 0xAB
      payload.to_json.bytes do |b|
        output << (b ^ key)
        key = (b ^ key)
      end
      a = [output.size, *output]
      a.pack('NC*')
    end

    def decrypt(payload)
      key = 0xAB
      array = []
      payload.bytes[4..-1].each do |b, i|
        array << (b ^ key)
        key = b
      end
      result = array.pack('C*')
      JSON.parse(result)
    end
  end
end
