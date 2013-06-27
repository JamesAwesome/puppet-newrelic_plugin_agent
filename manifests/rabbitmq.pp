class newrelic_plugin_agent::rabbitmq(
  $vhostname,
  $node,
  $port,
  $username,
  $password,
  $cfg_file  = $::newrelic_plugin_agent::cfg_file
) {

  concat::fragment {'newrelic_plugin_agent_rabbitmq':
    target  => $cfg_file,
    content => template('newrelic_plugin_agent/config_rabbitmq.erb'),
    order   => 03,
  }

}
