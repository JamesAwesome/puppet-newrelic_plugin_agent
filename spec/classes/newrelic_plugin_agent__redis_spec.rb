require 'rubygems'
require 'bundler/setup'
require 'spec_helper'

describe 'newrelic_plugin_agent::redis', :type => 'class' do

  context "When called with strings as parameters" do
    let(:params) { {
      :redis_name => 'foo',
      :node       => 'foo',
      :port       => '27017',
      :password   => 'bar',
      :db_count   => '6',
      :cfg_file   => '/etc/newrelic/newrelic_plugin_agent.cfg'
    } }

    it { should contain_concat__fragment('newrelic_plugin_agent_redis').with(
      'target'  => '/etc/newrelic/newrelic_plugin_agent.cfg',
      'content' => /- name: foo.*host: foo.*port: 27017.*db_count: 6.*password: bar/m,
      'order'   => '03'
    ) }
  end

  context "When called with hashes as parameters" do
    let(:params) { {
      :redis_name => { 'redis1' => 'foo', 'redis2' => 'foo2' },
      :node       => { 'redis1' => 'foo', 'redis2' => 'foo2' },
      :port       => { 'redis2' => '456', 'redis1' => '123'  },
      :password   => { 'redis2' => 'bar' },
      :db_count   => { 'redis1' => '6', 'redis2' => '7' },
      :cfg_file   => '/etc/newrelic/newrelic_plugin_agent.cfg'
    } }

    it { should contain_concat__fragment('newrelic_plugin_agent_redis').with(
      'target'  => '/etc/newrelic/newrelic_plugin_agent.cfg',
      'content' => /- name: foo.*host: foo.*port: 123.*db_count: 6.*- name: foo2.*host: foo2.*port: 456.*db_count: 7.*password: bar/m,
      'order'   => '03'
    ) }
  end

end
