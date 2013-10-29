class haveged::params {

  $package_ensure    = 'present'
  $service_enable    = true
  $service_ensure    = 'running'
  $service_manage    = true
  $package_name      = [ 'haveged' ]
  $service_name      = 'haveged'

  case $::osfamily {
    'Archlinux': {
      #$config          = '/etc/haveged.conf'
      #$package_name    = [ 'haveged' ]
      #$service_name    = 'havegedd'
    }
    'Linux': {
      # Account for distributions that don't have $::osfamily specific settings.
      case $::operatingsystem {
        default: {
          fail("The ${module_name} module is not supported on an ${::operatingsystem} distribution.")
        }
      }
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }
}
