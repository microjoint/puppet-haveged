#haveged

####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with haveged](#setup)
    * [What haveged affects](#what-haveged-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with haveged](#beginning-with-haveged)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

##Overview

The haveged module installs, configures, and manages the haveged service.

##Module Description

The haveged module handles running haveged mainly on Arch Linux. Were possible I have added other distributions where known.

##Setup

###What haveged affects

* haveged package.
* haveged configuration file.
* haveged service.

###Beginning with haveged

include '::haveged' is enough to get you up and running.  If you wish to pass in
parameters like if the service should be running, use:

```puppet
class { '::haveged':
  service_ensure => true,
}
```

##Usage

All interaction with the haveged module can do be done through the main haveged class.
This means you can simply toggle the options in the haveged class to get at the
full functionality.

###I just want haveged, what's the minimum I need?

```puppet
include '::haveged'
```

###I want to enable the service on startup.

```puppet
class { '::haveged':
  service_enable => true,
}
```

###I'd like to install a different package name as well.

```puppet
class { '::haveged':
  service_enable  => true,
  package_name    => 'haveged-beta',
}
```

###I'd like to opt out of having the service controlled, we use another tool for that.

```puppet
class { '::haveged':
  service_enable  => true,
  package_name    => 'haveged-beta',
  manage_service  => false,
}
```

##Reference

###Classes

* haveged: Main class, includes all the rest.
* haveged::install: Handles the packages.
* haveged::config: Handles the configuration file.
* haveged::service: Handles the service.

###Parameters

The following parameters are available in the haveged module

####`package_ensure`

This can be set to 'present' or 'latest' or a specific version to choose the
haveged package to be installed.

####`package_name`

This determines the name of the package to install.

####`service_enable`

This determines if the service should be enabled at boot.

####`service_ensure`

This determines if the service should be running or not.

####`service_manage`

This selects if puppet should manage the service in the first place.

####`service_name`

This selects the name of the haveged service for puppet to manage.


##Limitations

This module has been built on and tested against Puppet 3.3 and higher.

The module has been tested on:

* Arch Linux

Testing on other platforms has been light and cannot be guaranteed. 
