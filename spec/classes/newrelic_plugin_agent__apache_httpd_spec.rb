require 'rubygems'
require 'bundler/setup'
require 'spec_helper'

describe 'newrelic_plugin_agent::apache_httpd', :type => 'class' do
  context "When called with valid parameters" do
    let(:params) { {
      :vhostname => 'foo',
      :node      => 'foo',
      :port      => '80',
      :path      => '/server-status',
      :cfg_file  => '/etc/newrelic/newrelic_plugin_agent.cfg'
    } }

    it { should contain_concat__fragment('newrelic_plugin_agent_apache_httpd').with(
      'target'  => '/etc/newrelic/newrelic_plugin_agent.cfg',
      'content' => /apache_httpd:.*name: foo.*host: foo.* port: 80.*path: \/server-status/m,
      'order'   => '03'
    ) }
  end
end
