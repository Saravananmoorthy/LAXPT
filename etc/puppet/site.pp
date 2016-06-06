# site.pp - main target(s)

node 'xmon.vm.local' {
  include debugging
}

node 'checkmk.vm.local' {
  notify {'checkmk':}
}

node 'solr.vm.local' {
  notify{'solr':}
}

node 'puppet.vm.local' {
  notify {'puppet':}
}

node 'jenkins.vm.local' {
  notify {'jenkins':}
}

node 'docker.vm.local' {
  notify {'docker':}
}
