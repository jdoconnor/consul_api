module ConsulApi
  class Catalog
    include Common

    def self.register(query)
      issue_request(method: :put, path: '/register', query: query)
    end

    def self.deregister(query)
      issue_request(method: :put, path: '/deregister', query: query)
    end

    def self.datacenters
      issue_request(path: '/datacenters')
    end

    def self.nodes
      issue_request(path: '/nodes')
    end

    def self.services
      issue_request(path: '/services')
    end

    def self.node(name=nil)
      issue_request(path: "/node/#{name}")
    end

    def self.service(name=nil)
      issue_request(path: "/service/#{name}")
    end

    def self.base_url
      "#{ENV['CONSUL_SERVER_URL']}/v1/catalog"
    end
  end
end
