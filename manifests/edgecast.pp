class newrelic_plugin_agent::edgecast(
  $account,
  $account_number,
  $api_token,
  $cfg_file        = $::newrelic_plugin_agent::cfg_file
) {

  concat::fragment {'newrelic_plugin_agent_edgecast':
    target  => $cfg_file,
    content => template('newrelic_plugin_agent/config_edgecast.erb'),
    order   => 03,
  }

}
