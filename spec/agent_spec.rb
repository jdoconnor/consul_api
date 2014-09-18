require 'spec_helper'

describe ConsulApi::Agent, :vcr do
  describe '#services' do
    it 'gets services running on an agent' do
      expect(ConsulApi::Agent.services).to be_a(Hash)
    end
  end

  describe '#service_register' do
    it 'registers a service on consul' do
      expect(ConsulApi::Agent.service_register({'ID' => '123', 'Name' => 'abc'})).to be_a(Hash)
    end
  end

end
