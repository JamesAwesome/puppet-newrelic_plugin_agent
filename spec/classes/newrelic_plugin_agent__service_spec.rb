require 'rubygems'
require 'bundler/setup'
require 'spec_helper'

describe 'newrelic_plugin_agent::service', :type => 'class' do

  context "If called with valid parameters on a Debian host" do
    cfg_dir  = '/etc/newrelic'
    cfg_file = "#{cfg_dir}/newrelic_plugin_agent.cfg"
    let(:facts) { { :osfamily => 'Debian' } }
    let(:params) { { :service_user => 'newrelic', :cfg_dir => cfg_dir, :cfg_file => cfg_file } }
    it "On debian install the upstart script and start newrelic-plugin-agent" do
      should contain_file('/etc/init.d/newrelic_plugin_agent').with(
        'ensure'  => 'present',
	'content' => /CONFIG="\/etc\/newrelic\/newrelic_plugin_agent\.cfg"/,
        'owner'   => 'root',
        'group'   => 'root',
        'mode'    => '755',
        'notify'  => 'Service[newrelic_plugin_agent]'
      )
      should contain_service('newrelic_plugin_agent').with(
        'ensure'   => 'running',
        'enable'   => 'true',
        'require'  => [ 'User[newrelic]',
		         'File[/etc/init.d/newrelic_plugin_agent]',
                         "Concat[#{cfg_file}]" ]
      ) 
    end
  end

  context "If called with valid parameters on a RedHat host" do
    cfg_dir  = '/etc/newrelic'
    cfg_file = "#{cfg_dir}/newrelic_plugin_agent.cfg"
    let(:facts) { { :osfamily => 'RedHat' } }
    let(:params) { { :service_user => 'newrelic', :cfg_dir => cfg_dir, :cfg_file => cfg_file } }

    it "On RedHat based host install the rhel init script" do
      should contain_file('/etc/init.d/newrelic_plugin_agent').with(
        'ensure'  => 'present',
	'content' => /CONFIG_DIR="\/etc\/newrelic"/,
        'owner'   => 'root',
        'group'   => 'root',
        'mode'    => '755',
        'notify'  => 'Service[newrelic_plugin_agent]'
      )
      should contain_service('newrelic_plugin_agent').with(
        'ensure'   => 'running',
        'enable'   => 'true',
        'require'  => [ 'User[newrelic]',
		         'File[/etc/init.d/newrelic_plugin_agent]',
                         "Concat[#{cfg_file}]" ]
      ) 
    end
  end
end
