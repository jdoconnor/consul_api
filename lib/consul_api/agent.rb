module ConsulApi
  class Agent
    include Common

    def self.checks
      issue_request(path: '/checks')
    end

    def self.services
      issue_request(path: '/services')
    end

    def self.members
      issue_request(path: '/members')
    end

    def self.self
      issue_request(path: '/self')
    end

    def self.join(address, query={})
      issue_request(path: "/join/#{address}", query: query)
    end

    def self.force_leave(address)
      issue_request(path: "/force-leave/#{address}")
    end

    def self.check_register(query)
      issue_request(path: '/check/register/', query: query, method: :put)
    end

    def self.check_deregister(check_id)
      issue_request(path: "/check/deregister/#{check_id}", method: :put)
    end

    def self.check_pass(check_id, query={})
      issue_request(path: "/check/pass/#{check_id}", method: :put, query: query)
    end

    def self.check_warn(check_id, query={})
      issue_request(path: "/check/warn/#{check_id}", query: query)
    end

    def self.check_fail(check_id, query={})
      issue_request(path: "/check/fail/#{check_id}", query: query)
    end

    def self.service_register(query)
      issue_request(path: '/service/', query: query)
    end

    def self.service_deregister(service_id)
      issue_request(path: "/service/deregister/#{service_id}", method: :put)
    end

    def self.base_url
      "#{ENV['CONSUL_SERVER_URL']}/v1/agent"
    end
  end
end
