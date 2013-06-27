class newrelic_plugin_agent::memcached(
  $memcached_name,
  $node,
  $port          = '11211',
  $cfg_file      = $::newrelic_plugin_agent::cfg_file
) {

  concat::fragment {'newrelic_plugin_agent_memcached':
    target  => $cfg_file,
    content => template('newrelic_plugin_agent/config_memcached.erb'),
    order   => 03,
  }

}
