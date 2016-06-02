# Class opsview::node
#
# Usage:
#
#  class { 'opsview::node':
#    eipaddress     => '192.168.0.1', # explicit IP address
#    allowed_ips    => [ '192.168.1.10', '192.168.1.20', ],
#    listen_port    => '4949',
#    listen_address => '*',
#    ensure_service => running,
#    enable_service => true,
#
#  }

class opsview::node (
    $ensure          = installed,
    $eipaddress      = undef,
    $listen_address  = '*',
    $listen_port     = '4949',
    $ignore_files    = [],
    $allowed_ips     = [],
    $ensure_service  = running,
    $enable_service  = true,
    $minimal_plugins = false,
) {

  case $::osfamily {
    'redhat': {
      $log_dir      = '/var/log/opsview-node'
      $cidr_package = 'perl-Net-CIDR'
    }
    'debian': {
      $log_dir      = '/var/log/opsview'
      $cidr_package = 'libnet-cidr-perl'
    }
    default: { fail ("Error: Unrecognized operating system = ${::operatingsystem}") }
  }

  package { $cidr_package:
    ensure => installed,
  }

  package { 'opsview-node':
    ensure  => $ensure,
    require => Package[$cidr_package],
  }

  service { 'opsview-node':
    ensure     => $ensure_service,
    enable     => $enable_service,
    hasrestart => true,
    hasstatus  => true,
    require    => Package['opsview-node'],
  }

  file { 'opsview-node.conf':
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0644',
    path    => '/etc/opsview/opsview-node.conf',
    content => template('opsview/opsview-node.conf.erb'),
    require => Package['opsview-node'],
    notify  => Service['opsview-node'],
  }

  # NOTE: minimize enabled plugins to decrease graphs
  if $minimal_plugins {
    Exec {
      path      => [ '/bin/', '/usr/bin ', '/sbin', ],
      logoutput => on_failure,
    }

    # put the script to /tmp/ & then run it via exec
    file { 'plugins-minimal.sh':
      path    => '/etc/opsview/plugins-minimal.sh',
      owner   => 'root',
      group   => 'root',
      mode    => '0600',
      source  => 'puppet:///modules/opsview/plugins-minimal.sh',
      require => Package['opsview-node'],
    }

    exec { 'plugins-minimal':
      command     => 'bash /etc/opsview/plugins-minimal.sh',
      user        => 'root',
      group       => 'root',
      refreshonly => true,
      subscribe   => File['plugins-minimal.sh'],
      notify      => Service['opsview-node'],
    }

  }

  # NOTE: export opsview-node info
  # this automatically adds the node to opsview server 
  #   for monitoring once realized
  @@file { "/etc/opsview/opsview-conf.d/${::fqdn}.conf":
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0644',
    tag     => 'opsview-node',
    content => template('opsview/opsview-conf-node-info.erb'),
  }

}
