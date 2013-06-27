class newrelic_plugin_agent::service(
  $service_user = $::newrelic_plugin_agent::service_user,
  $cfg_dir      = $::newrelic_plugin_agent::cfg_dir,
  $cfg_file     = $::newrelic_plugin_agent::cfg_file,
  $pid_file      = $::newrelic_plugin_agent::pid_file
) {

  file {'/etc/init.d/newrelic_plugin_agent':
    ensure  => present,
    content => $::osfamily ? {
      'Debian' => template('newrelic_plugin_agent/newrelic_plugin_agent.deb.erb'),
      'RedHat' => template('newrelic_plugin_agent/newrelic_plugin_agent.rhel.erb'),
      default  => err("osfamily: ${::osfamily} is incompatible with this module")
    },
    owner   => 'root',
    group   => 'root',
    mode    => '755',
    notify  => Service[newrelic_plugin_agent],
  }

  service {'newrelic_plugin_agent':
    ensure   => running,
    enable   => true,
    require  => [ User[$service_user],
                  File["/etc/init.d/newrelic_plugin_agent"],
                  Concat[$cfg_file] ]
  }

}
