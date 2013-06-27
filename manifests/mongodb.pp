class newrelic_plugin_agent::mongodb(
  $mongodb_name,
  $node,
  $databases,
  $port          = '27017',
  $username      = undef,
  $password      = undef,
  $cfg_file      = $::newrelic_plugin_agent::cfg_file
) {

  concat::fragment {'newrelic_plugin_agent_mongodb':
    target  => $cfg_file,
    content => template('newrelic_plugin_agent/config_mongodb.erb'),
    order   => 03,
  }

}
