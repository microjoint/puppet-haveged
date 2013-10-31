#
class haveged::install inherits haveged {

  package { 'haveged':
    ensure => $package_ensure,
    name   => $package_name,
  }

}
