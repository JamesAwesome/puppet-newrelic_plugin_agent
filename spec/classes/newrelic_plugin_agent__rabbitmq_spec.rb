require 'rubygems'
require 'bundler/setup'
require 'spec_helper'

describe 'newrelic_plugin_agent::rabbitmq', :type => 'class' do
  context "When called with valid parameters" do
    let(:params) { {
      :name     => 'foo',
      :host     => 'foo',
      :port     => '123',
      :username => 'foo',
      :password => 'foo',
      :cfg_file => '/etc/newrelic/newrelic_plugin_agent.cfg'
    } }

    it { should contain_concat__fragment('newrelic_plugin_agent_rabbitmq').with(
      'target'  => '/etc/newrelic/newrelic_plugin_agent.cfg',
      'content' => /name: foo.*host: foo.* username: foo.*password: foo/m,
      'order'   => '03'
    ) }
  end
end
