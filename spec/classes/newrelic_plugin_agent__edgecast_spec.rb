require 'rubygems'
require 'bundler/setup'
require 'spec_helper'

describe 'newrelic_plugin_agent::edgecast', :type => 'class' do
  context "When called with valid parameters" do
    let(:params) { {
      :account        => 'foo',
      :account_number => '123',
      :api_token      => '123',
      :cfg_file       => '/etc/newrelic/newrelic_plugin_agent.cfg'
    } }

    it { should contain_concat__fragment('newrelic_plugin_agent_edgecast').with(
      'target'  => '/etc/newrelic/newrelic_plugin_agent.cfg',
      'content' => /name: foo.*account: 123.* token: 123/m,
      'order'   => '03'
    ) }
  end
end
