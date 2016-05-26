# site.pp - main target(s)

node /checkmk0[1-9].vm.local/ {
  include checkmk_agent

  include checkmk_host
}

node /solr0[1-9].vm.local/ {
  include checkmk_agent
}

node 'puppet01.vm.local' {
  include checkmk_agent
}

node 'xmon.vm.local' {
  include checkmk_agent
}

node 'munin.vm.local' {
  include checkmk_agent
}
