class newrelic_plugin_agent::postgresql(
  $dbhost,
  $port,
  $username,
  $dbname,
  $cfg_file = $::newrelic_plugin_agent::cfg_file
) {

  concat::fragment {'newrelic_plugin_agent_postgresql':
    target  => $cfg_file,
    content => template('newrelic_plugin_agent/config_postgresql.erb'),
    order   => 03,
  }

}
