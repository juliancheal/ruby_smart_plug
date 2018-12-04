require 'smart_plug'

plug = SmartPlug::HS110.new('192.168.1.155', 9999)
puts plug.system_info
# puts plug_b.on
# plug.night_mode
# plug.disable_night_mode
