require 'spec_helper'

describe ConsulApi::Catalog, :vcr do
  describe '#datacenters' do
    it 'returns an array of the data' do
      expect(ConsulApi::Catalog.datacenters).to be_a(Array)
    end
  end

  describe '#nodes' do
    it 'returns an array of the data' do
      expect(ConsulApi::Catalog.nodes).to be_a(Array)
    end
  end

  describe '#services' do
    it 'returns an array of the data' do
      expect(ConsulApi::Catalog.services).to be_a(Hash)
    end
  end

  describe '#node' do
    it 'returns an array of the data' do
      expect(ConsulApi::Catalog.node('488221c29862')).to be_a(Hash)
    end
  end

  describe '#service' do
    it 'returns an array of the data' do
      expect(ConsulApi::Catalog.service('abc')).to be_a(Array)
    end
  end
end
