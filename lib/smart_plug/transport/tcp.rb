require 'socket'

module SmartPlug
  class Transport
    class TCP < Transport
      include Logging

      def initialize(host, port)
        connect(host, port)
      end

      def connected?
        !!(@socket && !@socket.closed?)
      end

      def connect(host, port)
        @socket = TCPSocket.new(host, port)
        logger.info("#{self}: Connected.")
      rescue => ex
        logger.warn("#{self}: Exception occurred in #connect - #{ex}")
        logger.debug("#{self}: Backtrace: #{ex.backtrace.join("\n")}")
        @socket = nil
      end

      def close
        return if !@socket
        if !@socket.closed?
          @socket.close
        end
        @socket = nil
        if @listener
          @listener.abort
        end
        @listener = nil
      end

      def listen
        stream = ""
        begin
          stream = @socket.recv(1024)
        rescue => ex
          logger.warn("#{self}: Exception occurred in #listen - #{ex}")
          logger.debug("#{self}: Backtrace: #{ex.backtrace.join("\n")}")
          close
        end
        stream
      end

      def write(message)
        data = message
        @socket.write(data)
        true
      rescue => ex
        logger.warn("#{self}: Exception in #write: #{ex}")
        logger.debug("#{self}: Backtrace: #{ex.backtrace.join("\n")}")
        close
        false
      end
    end
  end
end
