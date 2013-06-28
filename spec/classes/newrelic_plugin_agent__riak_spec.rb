require 'rubygems'
require 'bundler/setup'
require 'spec_helper'

describe 'newrelic_plugin_agent::riak', :type => 'class' do
  context "When called with valid parameters" do
    let(:params) { {
      :riakhost => 'foo',
      :port     => '123',
      :username => 'bar',
      :cfg_file => '/etc/newrelic/newrelic_plugin_agent.cfg'
    } }

    it { should contain_concat__fragment('newrelic_plugin_agent_riak').with(
      'target'  => '/etc/newrelic/newrelic_plugin_agent.cfg',
      'content' => /riak:.*host: foo.*port: 123.* user: bar/m,
      'order'   => '03'
    ) }
  end
end
