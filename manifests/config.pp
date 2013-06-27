class newrelic_plugin_agent::config(
  $service_user   = $::newrelic_plugin_agent::service_user,
  $licence_key    = $::newrelic_plugin_agent::licence_key,
  $poll_interval  = $::newrelic_plugin_agent::poll_interval,
  $agent_loglevel = $::newrelic_plugin_agent::agent_loglevel,
  $cfg_file       = $::newrelic_plugin_agent::cfg_file,
  $log_file       = $::newrelic_plugin_agent::log_file,
  $pid_file       = $::newrelic_plugin_agent::pid_file
) {

  concat {$cfg_file:
    owner  => $service_user,
    group  => $service_user,
    mode   => '0740',
    notify => Service[newrelic_plugin_agent]
  }

  concat::fragment{'newrelic_plugin_agent_header':
    target  => $cfg_file,
    content => template("newrelic_plugin_agent/config_header.erb"),
    order   => 01,
  }

  concat::fragment{'newrelic_plugin_agent_footer':
    target  => $cfg_file,
    content => template("newrelic_plugin_agent/config_footer.erb"),
    order   => 99,
  }

}
