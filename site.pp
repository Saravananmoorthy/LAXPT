# site.pp - main target(s)

node 'checkmk01.vm.local' {
  notify {'test':}
  include checkmk
  notify {'test two': }

  include checkmk::server

}


#
#
# node 'checkmk02.vm.local' {
# }
#
#
# node 'solr01.vm.local' {
# }
#
#
# node 'solr02.vm.local' {
# }
#
#
# node 'javamon.vm.local' {
# }
