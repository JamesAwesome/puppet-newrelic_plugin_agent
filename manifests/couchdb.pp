class newrelic_plugin_agent::couchdb(
  $couchdb_name,
  $node,
  $port          = '5984',
  $cfg_file      = $::newrelic_plugin_agent::cfg_file
) {

  concat::fragment {'newrelic_plugin_agent_couchdb':
    target  => $cfg_file,
    content => template('newrelic_plugin_agent/config_couchdb.erb'),
    order   => 03,
  }

}
