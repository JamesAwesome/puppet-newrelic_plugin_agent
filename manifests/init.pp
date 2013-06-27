class newrelic_plugin_agent(
  $source         = undef,
  $ensure         = 'present',
  $service_user   = 'newrelic',
  $poll_interval  = '60',
  $licence_key    = 'REPLACE_WITH_REAL_KEY',
  $agent_loglevel = 'INFO',
  $cfg_dir        = '/etc/newrelic'
) {
  
  $cfg_file       = "${cfg_dir}/newrelic_plugin_agent.cfg"

  include stdlib,
          newrelic_plugin_agent::config,
          newrelic_plugin_agent::service

  package{'newrelic-plugin-agent':
    ensure   => $ensure,
    source   => $source,
    provider => pip,
  }

}
