# Encoding: UTF-8

require_relative '../spec_helper'
require_relative '../../libraries/provider_mapping'

describe :provider_mapping do
  let(:platform) { nil }
  let(:keynote_provider) do
    Chef::Platform.platforms[platform] && \
      Chef::Platform.platforms[platform][:default] && \
      Chef::Platform.platforms[platform][:default][:keynote_app]
  end
  let(:numbers_provider) do
    Chef::Platform.platforms[platform] && \
      Chef::Platform.platforms[platform][:default] && \
      Chef::Platform.platforms[platform][:default][:numbers_app]
  end
  let(:pages_provider) do
    Chef::Platform.platforms[platform] && \
      Chef::Platform.platforms[platform][:default] && \
      Chef::Platform.platforms[platform][:default][:pages_app]
  end

  context 'Mac OS X' do
    let(:platform) { :mac_os_x }

    %w(keynote numbers pages).each do |a|
      it "uses the MacAppStoreApp provider for #{a}" do
        expect(send(:"#{a}_provider")).to eq(Chef::Provider::MacAppStoreApp)
      end
    end
  end

  context 'Ubuntu' do
    let(:platform) { :ubuntu }

    %w(keynote numbers pages).each do |a|
      it "returns no #{a} provider" do
        expect(send(:"#{a}_provider")).to eq(nil)
      end
    end
  end
end
