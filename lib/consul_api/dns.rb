module ConsulApi
  class DNS
    include Common
    def self.resolve_service(host)
      srv = []
      srv = resolver.getresources(host, Resolv::DNS::Resource::IN::SRV)
      # Sort SRV records: lowest priority first, highest weight first
      srv.sort! { |a,b| (a.priority != b.priority) ? (a.priority <=> b.priority) : (b.weight <=> a.weight) }
      "#{resolve_node(srv.first.target)}:#{srv.first.port}"
    end

    def self.resolve_node(host)
      resolver.getaddress(host).to_s
    end

    def self.resolver
      Resolv::DNS.new(
        nameserver_port: [[host_ip, 8600]],
        search: [],
        ndots: 1
      )
    end
  end
end
