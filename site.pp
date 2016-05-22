# site.pp
node 'checkmk.vm.local' {
  include localuser
}

node 'solr01.vm.local' {
  notify { "Testing testing": }
  include localuser
}

node 'solr02.vm.local' {
  notify { "this is solr02....":}
}

node 'javamon.vm.local' {
  notify { "test one":}
}
