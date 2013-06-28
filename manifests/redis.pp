class newrelic_plugin_agent::redis(
  $redis_name,
  $node,
  $port,
  $db_count,
  $password = undef,
  $cfg_file = $::newrelic_plugin_agent::cfg_file
) {

  concat::fragment {'newrelic_plugin_agent_redis':
    target  => $cfg_file,
    content => template('newrelic_plugin_agent/config_redis.erb'),
    order   => 03,
  }

}
