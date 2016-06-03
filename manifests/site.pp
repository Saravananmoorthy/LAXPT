# site.pp - main target(s)

node /checkmk0[1-9].vm.local/ {
  notify {'checkmk':}
}

node /solr0[1-9].vm.local/ {
  notify{'solr':}
}

node 'puppet01.vm.local' {
  notify {'puppet':}
}

node 'xmon.vm.local' {
  notify {'xmon':}
}

node 'jenkins.vm.local' {
  notify {'jenkins':}
}

node 'docker.vm.local' {
  notify {'docker':}
}
