class newrelic_plugin_agent::nginx(
  $vhostname,
  $node,
  $port      = '80',
  $path      = '/nginx_stub_status',
  $cfg_file  = $::newrelic_plugin_agent::cfg_file
) {

  concat::fragment {'newrelic_plugin_agent_nginx':
    target  => $cfg_file,
    content => template('newrelic_plugin_agent/config_nginx.erb'),
    order   => 03,
  }

}
