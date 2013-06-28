require 'rubygems'
require 'bundler/setup'
require 'spec_helper'

describe 'newrelic_plugin_agent::nginx', :type => 'class' do
  context "When called with valid parameters" do
    let(:params) { {
      :vhostname => 'foo',
      :node      => 'foo',
      :port      => '80',
      :path      => '/server-status',
      :cfg_file  => '/etc/newrelic/newrelic_plugin_agent.cfg'
    } }

    it { should contain_concat__fragment('newrelic_plugin_agent_nginx').with(
      'target'  => '/etc/newrelic/newrelic_plugin_agent.cfg',
      'content' => /name: foo.*host: foo.* port: 80.*path: \/server-status/m,
      'order'   => '03'
    ) }
  end
end
