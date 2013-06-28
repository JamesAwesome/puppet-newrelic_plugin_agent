class newrelic_plugin_agent::pgbouncer(
  $pghost,
  $port,
  $username,
  $cfg_file = $::newrelic_plugin_agent::cfg_file
) {

  concat::fragment {'newrelic_plugin_agent_pgbouncer':
    target  => $cfg_file,
    content => template('newrelic_plugin_agent/config_pgbouncer.erb'),
    order   => 03,
  }

}
