# puppet-munin

This puppet module automates installation/management of the munin-node package

## TODOs
  * support for munin package
  * enable/disable plugins

## Versioning

This module adheres to [Semantic Versioning 2.0.0-rc.2](http://semver.org/).

## Parameters
  * `ensure`: installed OR absent OR purged, default=installed
  * `listen_address`: default='*'
  * `listen_port`:    default='4949'
  * `ignore_files`:   default=[]
  * `allowed_ips`:    default=[]
  * `eipaddress`:     default=facter ipaddress, what IP to put in munin master`s node config for this server
  * `ensure_service`: default=running
  * `enable_service`: default=true
  * `minimal_plugins`: boolean, install minimal plugins only, default=false

## Usage

    class { 'munin::node':
      allowed_ips     => [ '192.168.1.10', '192.168.1.20', ],
      listen_port     => '4949',
      listen_address  => '*',
      eipaddress      => '192.168.0.1', # explicit IP address
      ensure_service  => running,
      enable_service  => true,
      minimal_plugins => true, 
    }

## Automatically add munin nodes to munin master

    # tested to work on munin 2.0.6, relies on includedir
    node 'munin-master.mydomain.local' {
      File <<| tag == 'munin-node' |>>
    }

## Minimal plugins

<pre>
  cpu -> /usr/share/munin/plugins/cpu
  df -> /usr/share/munin/plugins/df
  df_inode -> /usr/share/munin/plugins/df_inode
  entropy -> /usr/share/munin/plugins/entropy
  forks -> /usr/share/munin/plugins/forks
  fw_packets -> /usr/share/munin/plugins/fw_packets
  if_err_eth0 -> /usr/share/munin/plugins/if_err_
  if_eth0 -> /usr/share/munin/plugins/if_
  interrupts -> /usr/share/munin/plugins/interrupts
  iostat_ios -> /usr/share/munin/plugins/iostat_ios
  irqstats -> /usr/share/munin/plugins/irqstats
  load -> /usr/share/munin/plugins/load
  memory -> /usr/share/munin/plugins/memory
  open_files -> /usr/share/munin/plugins/open_files
  open_inodes -> /usr/share/munin/plugins/open_inodes
  processes -> /usr/share/munin/plugins/processes
  proc_pri -> /usr/share/munin/plugins/proc_pri
  swap -> /usr/share/munin/plugins/swap
  threads -> /usr/share/munin/plugins/threads
  uptime -> /usr/share/munin/plugins/uptime
  vmstat -> /usr/share/munin/plugins/vmstat
</pre>

## Dependencies

None
