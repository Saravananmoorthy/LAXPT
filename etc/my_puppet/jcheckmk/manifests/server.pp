# install checkmk monitoring thingy on a box

## what other params do __you__ need??
class jcheckmk::server (
  $ensure              = $jcheckmk::server::parames::ensure,
  $configure_repo      = $jcheckmk::server::params::configure_repo,
  $repo                = $jcheckmk::server::params::repo,
  $sites               = $jcheckmk::server::params::sites,
  $sites_defaults      = $jcheckmk::server::params::sites_defaults,
  ) inherits jcheckmk::server::params {
    validate_re($ensure, ['^installed|latest|absent|purged$',
                          '^\d\.\d\d$'])
     validate_bool($configure_repo)
     validate_re($repo, '^stable|testing$')
     validate_hash($sites)

     contain 'jcheckmk::server::install'
     contain 'jcheckmk::server::config'

     Class['jcheckmk::server::install'] ->
     Class['jcheckmk::server::config']

     create_resources('jcheckmk::site', $sites, $sites_defaults)
  }
