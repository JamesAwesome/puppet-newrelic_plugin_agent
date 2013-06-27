class newrelic_plugin_agent::apache_httpd(
  $vhostname,
  $node,
  $port      = '80',
  $path      = '/server-status',
  $cfg_file  = $::newrelic_plugin_agent::cfg_file
) {

  concat::fragment {'newrelic_plugin_agent_apache_httpd':
    target  => $cfg_file,
    content => template('newrelic_plugin_agent/config_apache_httpd.erb'),
    order   => 03,
  }

}
