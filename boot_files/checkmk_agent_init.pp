# modules/checkmk_agent/manifests/init.pp
class checkmk_agent {
## prove that this package is installed on the remote nodes
  service { 'xinetd':
    ensure => running,
    enable => true,
    hasrestart => true,
    hasstatus  => true,
  }

  file { '/tmp/check-mk-agent_1.2.4p5-2_all.deb':
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => "puppet:///modules/checkmk_agent/check-mk-agent_1.2.4p5-2_all.deb",
  }

  package { 'checkmk-agent':
    ensure    => present,
    provider  => 'dpkg',
    source    => '/tmp/',
  }
}


# start xinetd

# configure xinetd if required

# kick
#
#
# root@linux# dpkg -i check-mk-agent_1.1.18-2_all.deb
# root@linux# dpkg -i check-mk-agent-logwatch_1.1.18-2_all.deb
#
# 2. Installing the Agent manually
#
# The check_mk agent for Linux consists of only two files: a shell skript called check_mk_agent.linux and a configuration file for xinetd.conf, both of which can be found in the subdirectory agents. xinetd is an improved version of the classical inetd and a is available or even standard on most current linux distributions.
#
# Alternatively you can use the classical inetd, but this documentation focusses on xinetd.
#
# Please install the file check_mk_agent.linux on your target host as /usr/bin/check_mk_agent (drop the .linux). You should be able to execute the agent simply by calling it from the command line. It can be run as non-root user, but some diagnostic information can only be retrieved if it is run as root. The output of check_mk_agent looks like this (abbreviated):
#
# root@linux# check_mk_agent
# <<<check_mk>>>
# Version: 1.1.8
# AgentOS: linux
# <<<df>>>
# /dev/sda1     ext3     1008888    223832    733808      24% /
# /dev/sdc1     ext3     1032088    284648    695012      30% /lib/modules
# <<<ps>>>
# init [3]
# /sbin/syslogd
# /sbin/klogd -x
# /usr/sbin/cron
# /sbin/getty 38400 tty2
# /sbin/getty 38400 tty3
# /sbin/getty 38400 tty4
# /sbin/getty 38400 tty5
# /sbin/getty 38400 tty6
# /sbin/getty 38400 tty1
# sshd: linux [priv]
# sshd: linux@ttyp0
# -sh
# /usr/sbin/sshd
# You should also install the file waitmax on your target host as e.g. /usr/bin/waitmax. This file is not mandatory, but really needed by the agent code of some checks like the nfsmounts, ipmi_sensors, ntpq, nvidia and cups_queues.
#
# The configuration of Xinetd is simple: Copy the file xinetd.conf into /etc/xinetd.d and rename it do check_mk:
#
# /etc/xinetd.d/check_mk
# service check_mk
# {
# 	type		= UNLISTED
# 	port		= 6556
# 	socket_type	= stream
# 	protocol	= tcp
# 	wait		= no
# 	user		= root
# 	server		= /usr/bin/check_mk_agent
# # configure the IP address(es) of your Nagios server here:
# #	only_from       = 127.0.0.1 10.0.20.1 10.0.20.2
# 	disable		= no
# }
# You might want to activate the only_from line. It allows you to specify a list of hosts that should be allowed to connect to the client. If you leave it out, there is no restriction. Then (re-)start Xinetd:
#
# root@linux# /etc/init.d/xinetd restart
# On some distributions you also need to activate the start script of Xinetd. Otherwise Xinetd will not be started automatically at the next reboot. On RedHat, SUSE and FEDORA this is done by:
#
# root@linux# chkconfig xinetd on
# On Debian and Ubuntu this is not neccessary. If everything went fine, then you are now able to retrieve the output of the agent by connecing to TCP port 6556 from the Nagios host. You can test this with:
#
# user@host> telnet xyzhost123 6556
# Trying 10.0.21.47...
# Connected to xyzhost123.
# Escape character is '^]'.
# <<<check_mk>>>
# Version: 1.1.8
# AgentOS: linux
# <<<df>>>
# /dev/sda1     ext3     1008888    223832    733808      24% /
# /dev/sdc1     ext3     1032088    284648    695012      30% /lib/modules
# <<<ps>>>
# init [3]
# /sbin/syslogd
# /sbin/klogd -x
# /usr/sbin/cron
# /sbin/getty 38400 tty2
# Note that if you want to test this on the Nagios server itself via localhost, then the IP address 127.0.0.1 has to be allowed in xinetd.conf. You could also check via netstat whether the TCP port 6556 has been opened:
#
# root@linux# netstat -ltn
# Active Internet connections (only servers)
# Proto Recv-Q Send-Q Local Address           Foreign Address         State
# tcp        0      0 0.0.0.0:6556            0.0.0.0:*               LISTEN
# tcp6       0      0 :::22                   :::*                    LISTEN
# 3. Accessing the agent via check_mk
#
# After a successful installation of the agent you can retrieve the data on the Nagios host via check_mk. This is done with
#
# user@host> check_mk -d xyzhost123
# <<<check_mk>>>
# Version: 1.1.8
# AgentOS: linux
# <<<df>>>
# /dev/sda1     ext3     1008888    223832    733808      24% /
# This should show the complete output from the agent. Your agent is now ready for usage.
#
# Please refer to Monitoring of Logfiles for the logwatch configuration.
#
# 4. Runas configuration and Agent Bakery
#
# With the functionality runas you can configure additional include files and directories for mrpe, local and plugin scripts. You can also change the user context of each of these scripts. It allows non-root users to add additional scripts which might get executed with reduced permissions.
#
# This check is configured with the configuration file runas.cfg. In a default installation this file is located within the Check_MK config directory under /etc/check_mk/runas.cfg.
#
# The runas.cfg configuration syntax is as follow:
#
# [Script type] [User context] [File/Directory]
#
# The [Script type] can be set to mrpe, local and plugin.
#
# The [User context] represents the user. If you do not want to change the context set this field to "-".
#
# Depending on the script type the third value points to a file or directory. The mrpe type requires a target file which contains the mrpe commands. Local and plugin types require a target folder, which contains the executable local and plugin scripts.
#
# Here is an example configuration:
#
# /etc/check_mk/runas.cfg
# mrpe     ab   /home/ab/mrpe_commands.cfg
# mrpe     lm   /home/lm/mrpe_commands.cfg
# mrpe     -    /root/mrpe/extra_commands.cfg
# plugin   ab   /var/ab/plugins
# local    ab   /var/ab/local
# Note:
# You need to set up the local and plugin scripts in different folders, because the line
# plugin ab /var/ab/plugins indicates that all executable files within this folder are treated as plugins.
#
# Agent Bakery:
# For easy usage and configuration of individual configurations you can also use the Agent Bakery in WATO. Please use the menu item Monitoring Agents. With several rules you can generate automatically installation packages for supported operating systems. The configuration is bundled with the agent and can be easily installed on the hosts. If you need to update, you can install the new generated package and do not take care about all the included files by hand.
