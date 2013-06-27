require 'rubygems'
require 'bundler/setup'
require 'spec_helper'

describe 'newrelic_plugin_agent::config', :type => 'class' do
  let(:facts) { { :concat_basedir => '/var/lib/puppet/concat' } }

  context "When called with valid parameters" do
    cfg_dir  = '/etc/newrelic'
    cfg_file = "#{cfg_dir}/newrelic_plugin_agent.cfg"
    
    let(:params) { {
      :service_user   => 'newrelic', 
      :licence_key    => 'foo', 
      :poll_interval  => "40",
      :agent_loglevel => 'INFO',
      :cfg_file       => cfg_file
    } }


    it "Will start concatinating the cfg file" do
      should contain_concat(cfg_file).with(
        'owner'  => 'newrelic',
        'group'  => 'newrelic',
        'mode'   => '0740',
        'notify' => 'Service[newrelic_plugin_agent]'
      )
      should contain_concat__fragment('newrelic_plugin_agent_header').with(
        'target'  => cfg_file,
        'content' => /license_key: foo\n  poll_interval: 40/,
        'order'   => '01'
      )
      should contain_concat__fragment('newrelic_plugin_agent_footer').with(
        'target'  => cfg_file,
        'content' => /user: newrelic.*level: INFO/m,
        'order'   => '99'
      )
    end
  end
end
