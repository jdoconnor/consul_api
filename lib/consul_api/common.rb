module ConsulApi
  module Common
    module ClassMethods
      def issue_request(method: :get, path: '', query: nil)
        conn = Faraday.new(:url => "#{base_url}#{path}")
        response = conn.send(method) do |req|
          req.headers['Content-Type'] = 'application/json'
          req.body = query.to_json
        end

        # gets and puts will fail with an http status code in the 4xx and 5xx range
        fail "http status #{response.status} returned from consul" if response.status >= 400

        # if the response is empty, return an empty hash
        body = response.body == '' ? '{}' : response.body

        begin
          parsed_response = JSON.parse(body)
        rescue => e
          fail "unable to parse the json returned by Consul.  Returned data: #{response.body}"
        end

        return Hashie::Mash.new(parsed_response) if parsed_response.is_a?(Hash)
        # assume array otherwise, and return a collection of Mashes
        parsed_response.map { |node| Hashie::Mash.new(node) }
      end

      def consul_ip
        # override with an environment variable, or read from the gateway of docker0 interface
        @@consul_ip ||= ENV['CONSUL_IP'] ? ENV['CONSUL_IP'] : `route -n | grep 'UG[ \t]' | awk '{print $2}'`.strip
      end

      def consul_api_port
        @@consul_api_port ||= ENV['CONSUL_API_PORT'] ? ENV['CONSUL_API_PORT'] : 8500
      end

      def consul_dns_port
        @@consul_dns_port ||= ENV['CONSUL_DNS_PORT'] ? ENV['CONSUL_DNS_PORT'] : 8600
      end

      def consul_api_url
        "http://#{consul_ip}:#{consul_api_port}"
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
    end
  end
end
