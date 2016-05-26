# puppet-opsview

This puppet module automates installation/management of the opsview-node package

## TODOs
  * support for opsview package
  * enable/disable plugins

## Versioning

This module adheres to [Semantic Versioning 2.0.0-rc.2](http://semver.org/).

## Parameters
  * `ensure`: installed OR absent OR purged, default=installed
  * `listen_address`: default='*'
  * `listen_port`:    default='4949'
  * `ignore_files`:   default=[]
  * `allowed_ips`:    default=[]
  * `eipaddress`:     default=facter ipaddress, what IP to put in opsview master`s node config for this server
  * `ensure_service`: default=running
  * `enable_service`: default=true
  * `minimal_plugins`: boolean, install minimal plugins only, default=false

## Usage

    class { 'opsview::node':
      allowed_ips     => [ '192.168.1.10', '192.168.1.20', ],
      listen_port     => '4949',
      listen_address  => '*',
      eipaddress      => '192.168.0.1', # explicit IP address
      ensure_service  => running,
      enable_service  => true,
      minimal_plugins => true, 
    }

## Automatically add opsview nodes to opsview master

    # tested to work on opsview 2.0.6, relies on includedir
    node 'opsview-master.mydomain.local' {
      File <<| tag == 'opsview-node' |>>
    }

## Minimal plugins

<pre>
  cpu -> /usr/share/opsview/plugins/cpu
  df -> /usr/share/opsview/plugins/df
  df_inode -> /usr/share/opsview/plugins/df_inode
  entropy -> /usr/share/opsview/plugins/entropy
  forks -> /usr/share/opsview/plugins/forks
  fw_packets -> /usr/share/opsview/plugins/fw_packets
  if_err_eth0 -> /usr/share/opsview/plugins/if_err_
  if_eth0 -> /usr/share/opsview/plugins/if_
  interrupts -> /usr/share/opsview/plugins/interrupts
  iostat_ios -> /usr/share/opsview/plugins/iostat_ios
  irqstats -> /usr/share/opsview/plugins/irqstats
  load -> /usr/share/opsview/plugins/load
  memory -> /usr/share/opsview/plugins/memory
  open_files -> /usr/share/opsview/plugins/open_files
  open_inodes -> /usr/share/opsview/plugins/open_inodes
  processes -> /usr/share/opsview/plugins/processes
  proc_pri -> /usr/share/opsview/plugins/proc_pri
  swap -> /usr/share/opsview/plugins/swap
  threads -> /usr/share/opsview/plugins/threads
  uptime -> /usr/share/opsview/plugins/uptime
  vmstat -> /usr/share/opsview/plugins/vmstat
</pre>

## Dependencies

None
