# ConsulApi

Ruby gem for accessing Consul.  The defaults heavily skew toward running it in a docker contianer, but it is configurable for whatever.

## Installation

Add this line to your application's Gemfile:

    gem 'consul_api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install consul_api

## Usage
Agent, Catalog, and DNS requests are currently supported.

Agent
```ruby
ConsulApi::Agent.checks
ConsulApi::Agent.services
ConsulApi::Agent.members
ConsulApi::Agent.self
ConsulApi::Agent.join(address, query={})
ConsulApi::Agent.force_leave(address)
ConsulApi::Agent.check_register(query)
ConsulApi::Agent.check_deregister(check_id)
ConsulApi::Agent.check_pass(check_id, query={})
ConsulApi::Agent.check_warn(check_id, query={})
ConsulApi::Agent.check_fail(check_id, query={})
ConsulApi::Agent.service_register(query)
ConsulApi::Agent.service_deregister(service_id)
```

Catalog
```ruby
ConsulApi::Catalog.register(query)
ConsulApi::Catalog.deregister(query)
ConsulApi::Catalog.datacenters
ConsulApi::Catalog.nodes
ConsulApi::Catalog.services
ConsulApi::Catalog.node(name=nil)
ConsulApi::Catalog.service(name=nil)
```

DNS
```ruby
# get the server's address from a hostname.  Uses Consul's SRV records.
ConsulApi::DNS.resolve_service(hostname) # => "1.2.3.4:8888" <ip>:<port>
```

Configuration
The following variables are overwritable via the ENV
```ruby
CONSUL_IP # default: docker0 address (for running inside of a container where your consul agent is exposed to your host)
CONSUL_API_PORT # 8500
CONSUL_DNS_PORT # 8600
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/consul_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
