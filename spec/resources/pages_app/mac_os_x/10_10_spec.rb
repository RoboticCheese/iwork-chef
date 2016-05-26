require_relative '../../../spec_helper'

describe 'resource_pages::mac_os_x::10_10' do
  let(:name) { 'default' }
  let(:action) { nil }
  let(:runner) do
    ChefSpec::SoloRunner.new(
      step_into: 'pages_app', platform: 'mac_os_x', version: '10.10'
    ) do |node|
      %i(name action).each do |a|
        node.set['resource_pages_app_test'][a] = send(a) unless send(a).nil?
      end
    end
  end
  let(:chef_run) { runner.converge('resource_pages_app_test') }

  context 'the default action (:install)' do
    let(:action) { nil }

    it 'configures the Mac App Store' do
      expect(chef_run).to include_recipe('mac-app-store')
    end

    it 'installs Pages via the App Store' do
      expect(chef_run).to install_mac_app_store_app('Pages')
    end
  end

  context 'the :upgrade action' do
    let(:action) { :upgrade }

    it 'configures the Mac App Store' do
      expect(chef_run).to include_recipe('mac-app-store')
    end

    it 'upgrades Pages via the App Store' do
      expect(chef_run).to upgrade_mac_app_store_app('Pages')
    end
  end
end
