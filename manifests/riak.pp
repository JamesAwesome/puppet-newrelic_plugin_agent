class newrelic_plugin_agent::riak(
  $riakhost,
  $port,
  $username,
  $cfg_file = $::newrelic_plugin_agent::cfg_file
) {

  concat::fragment {'newrelic_plugin_agent_riak':
    target  => $cfg_file,
    content => template('newrelic_plugin_agent/config_riak.erb'),
    order   => 03,
  }

}
