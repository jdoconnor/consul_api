module ConsulApi
  module Common
    module ClassMethods
      def issue_request(method: :get, path: '', query: nil)
        response = Faraday.send(method, "#{base_url}#{path}", query)
        begin
          parsed_response = JSON.parse(response.body)
        rescue => e
          fail "unable to parse the json returned by Consul.  Returned data: #{response.body}"
        end
        return Hashie::Mash.new(parsed_response) if parsed_response.is_a?(Hash)
        # assume array otherwise, and return a collection of Mashes
        parsed_response.map { |node| Hashie::Mash.new(node) }
      end

      def host_ip
        # override with an environment variable, or read from the gateway
        @@host_ip ||= ENV['CONSUL_IP']
        @@host_ip ||= `/sbin/ip route|awk '/default/ { print $3 }'`
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
    end
  end
end
