class haveged (
  $config            = $haveged::params::config,
  $config_dir        = $haveged::params::config_dir,
  $package_ensure    = $haveged::params::package_ensure,
  $package_name      = $haveged::params::package_name,
  $service_enable    = $haveged::params::service_enable,
  $service_ensure    = $haveged::params::service_ensure,
  $service_manage    = $haveged::params::service_manage,
  $service_name      = $haveged::params::service_name,
) inherits haveged::params {

  validate_string($config_dir)
  validate_string($package_ensure)
  validate_array($package_name)
  validate_bool($service_enable)
  validate_string($service_ensure)
  validate_bool($service_manage)
  validate_string($service_name)

  include '::haveged::install'
  include '::haveged::config' 
  include '::haveged::service'

  Class['::haveged::install'] -> Class['::haveged::config'] ~> Class['::haveged::service']

}
