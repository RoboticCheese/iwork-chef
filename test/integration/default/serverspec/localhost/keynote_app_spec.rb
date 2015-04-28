# Encoding: UTF-8

require_relative '../spec_helper'

describe 'Keynote app' do
  describe package('com.apple.pkg.Keynote6') do
    it 'is installed' do
      expect(subject).to be_installed.by(:pkgutil)
    end
  end

  describe file('/Applications/Keynote.app') do
    it 'is present on the filesystem' do
      expect(subject).to be_directory
    end
  end
end
