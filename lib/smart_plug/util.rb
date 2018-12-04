module SmartPlug
  class Util

    def send(ip_address, port, payload)
      socket = SmartPlug::Transport::TCP.new(ip_address, port)
      socket.write(payload)
      socket.listen
    ensure
      socket.close rescue nil
    end
  end
end
