require 'rubygems'
require 'bundler/setup'
require 'spec_helper'

describe 'newrelic_plugin_agent::mongodb', :type => 'class' do
  context "When called with valid parameters" do
    let(:params) { {
      :mongodb_name => 'foo',
      :node         => 'foo',
      :port         => '27017',
      :username     => 'bar',
      :password     => 'bar',
      :databases    => ['foo', 'bar'],
      :cfg_file  => '/etc/newrelic/newrelic_plugin_agent.cfg'
    } }

    it { should contain_concat__fragment('newrelic_plugin_agent_mongodb').with(
      'target'  => '/etc/newrelic/newrelic_plugin_agent.cfg',
      'content' => /name: foo.*host: foo.*port: 27017.*username: bar.*password: bar.*databases:\n\s+- foo\n\s+- bar/m,
      'order'   => '03'
    ) }
  end
end
