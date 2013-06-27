require 'rubygems'
require 'bundler/setup'
require 'spec_helper'

describe 'newrelic_plugin_agent', :type => 'class' do
  let(:facts) { { :concat_basedir => '/var/lib/puppet/concat', :osfamily => 'Debian' } }

  context "Whenever called on a supported host" do

    it "Includes required subclasses" do
      should include_class('newrelic_plugin_agent::config')
      should include_class('newrelic_plugin_agent::service')
    end
  end

  context "When installing from pip defaults without specifying version on a supported host" do
    let(:params) { { :ensure => 'present' } }

    it {
      should contain_package('newrelic-plugin-agent').with(
        'ensure'   => 'present',
        'source'   => nil,
        'provider' => 'pip'
      )
    }
  end

  context "When installing agent with a version number from pip on a supported host" do

    ['1', '1.2', '1.2.3'].each.to_s do |version|
      let(:params) { { :ensure => version } }
      it "Should install newrelic version #{version}" do
        should contain_package('newrelic-plugin-agent').with(
          'ensure'   => version,
          'source'   => nil,
          'provider' => 'pip'
	)
      end
    end
  end
end
