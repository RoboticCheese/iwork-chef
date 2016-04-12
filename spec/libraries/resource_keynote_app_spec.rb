# Encoding: UTF-8

require_relative '../spec_helper'
require_relative '../../libraries/resource_keynote_app'

describe Chef::Resource::KeynoteApp do
  let(:name) { 'default' }
  let(:resource) { described_class.new(name, nil) }

  describe '#initialize' do
    it 'sets the correct resource name' do
      expect(resource.resource_name).to eq(:keynote_app)
    end
  end

  describe '#app_name' do
    it 'uses the correct app name' do
      expect(resource.app_name).to eq('Keynote')
    end
  end

  describe '#bundle_id' do
    it 'uses the correct bundle ID' do
      expect(resource.bundle_id).to eq('com.apple.pkg.Keynote6')
    end
  end
end
