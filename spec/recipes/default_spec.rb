# Encoding: UTF-8

require 'spec_helper'

describe 'iwork::default' do
  let(:platform) { { platform: 'mac_os_x', version: '10.10' } }
  let(:runner) { ChefSpec::SoloRunner.new(platform) }
  let(:chef_run) { runner.converge(described_recipe) }

  it 'installs Keynote' do
    expect(chef_run).to install_keynote_app('default')
  end

  it 'installs Numbers' do
    expect(chef_run).to install_numbers_app('default')
  end

  it 'installs Pages' do
    expect(chef_run).to install_pages_app('default')
  end
end
