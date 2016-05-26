#!/bin/bash

set -e

# define path
export PATH="/bin:/usr/bin:$PATH"

DIR_SRC_PLUGIN='/usr/share/munin/plugins'
DIR_DEP_PLUGIN='/etc/munin/plugins'

# delete all plugins and recreate
if [[ ${#DIR_DEP_PLUGIN} -gt 6 ]] && [[ $DIR_DEP_PLUGIN =~ plugins$ ]]
then
  rm -f -v $DIR_DEP_PLUGIN/*

  # recreate links
  ln -s -v $DIR_SRC_PLUGIN/cpu         $DIR_DEP_PLUGIN/cpu
  ln -s -v $DIR_SRC_PLUGIN/df          $DIR_DEP_PLUGIN/df
  ln -s -v $DIR_SRC_PLUGIN/df_inode    $DIR_DEP_PLUGIN/df_inode
  ln -s -v $DIR_SRC_PLUGIN/entropy     $DIR_DEP_PLUGIN/entropy
  ln -s -v $DIR_SRC_PLUGIN/forks       $DIR_DEP_PLUGIN/forks
  ln -s -v $DIR_SRC_PLUGIN/fw_packets  $DIR_DEP_PLUGIN/fw_packets
  ln -s -v $DIR_SRC_PLUGIN/if_err_     $DIR_DEP_PLUGIN/if_err_eth0
  ln -s -v $DIR_SRC_PLUGIN/if_         $DIR_DEP_PLUGIN/if_eth0
  ln -s -v $DIR_SRC_PLUGIN/interrupts  $DIR_DEP_PLUGIN/interrupts
  ln -s -v $DIR_SRC_PLUGIN/iostat_ios  $DIR_DEP_PLUGIN/iostat_ios
  ln -s -v $DIR_SRC_PLUGIN/irqstats    $DIR_DEP_PLUGIN/irqstats
  ln -s -v $DIR_SRC_PLUGIN/load        $DIR_DEP_PLUGIN/load
  ln -s -v $DIR_SRC_PLUGIN/memory      $DIR_DEP_PLUGIN/memory
  ln -s -v $DIR_SRC_PLUGIN/open_files  $DIR_DEP_PLUGIN/open_files
  ln -s -v $DIR_SRC_PLUGIN/open_inodes $DIR_DEP_PLUGIN/open_inodes
  ln -s -v $DIR_SRC_PLUGIN/processes   $DIR_DEP_PLUGIN/processes
  ln -s -v $DIR_SRC_PLUGIN/proc_pri    $DIR_DEP_PLUGIN/proc_pri
  ln -s -v $DIR_SRC_PLUGIN/swap        $DIR_DEP_PLUGIN/swap
  ln -s -v $DIR_SRC_PLUGIN/threads     $DIR_DEP_PLUGIN/threads
  ln -s -v $DIR_SRC_PLUGIN/uptime      $DIR_DEP_PLUGIN/uptime
  ln -s -v $DIR_SRC_PLUGIN/vmstat      $DIR_DEP_PLUGIN/vmstat
else
  echo "Error: Can't delete files in ${DIR_DEP_PLUGIN}"
  exit 1
fi

