# site.pp
node 'checkmk.vm.local' {
  notify { 'this is the __first__ server': }

  include checkmk
  # file { '/tmp/check-mk-raw-1.2.8p1_0.trusty_amd64.deb':
  #   ensure =>  present,
  #   replace => 'no'
  #   source =>  'puppet:///modules/checkmk/check-mk-raw-1.2.8p1_0.trusty_amd64.deb',
  #   owner  =>  'root',
  #   group  =>  'root',
  # }
}


node 'solr01.vm.local' {
  notify { 'our __second__ server': }
}


node 'solr02.vm.local' {
  notify { '__third__ server': }
}


node 'javamon.vm.local' {
  notify { 'fourth and final server': }
}
