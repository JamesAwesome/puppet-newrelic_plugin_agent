require 'rubygems'
require 'bundler/setup'
require 'spec_helper'

describe 'newrelic_plugin_agent::memcached', :type => 'class' do
  context "When called with valid parameters" do
    let(:params) { {
      :memcached_name => 'foo',
      :node           => 'foo',
      :port           => '11211',
      :cfg_file  => '/etc/newrelic/newrelic_plugin_agent.cfg'
    } }

    it { should contain_concat__fragment('newrelic_plugin_agent_memcached').with(
      'target'  => '/etc/newrelic/newrelic_plugin_agent.cfg',
      'content' => /name: foo.*host: foo.* port: 11211/m,
      'order'   => '03'
    ) }
  end
end
