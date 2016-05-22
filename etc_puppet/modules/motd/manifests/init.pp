class motd {
  file { "/etc/motd":
    source => 'puppet:///modules/motd/test_motd',
  ensure => 'file',  }
}
