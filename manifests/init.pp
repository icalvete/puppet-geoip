class geoip (

  $root_path = '/opt/geoip',

) inherits geoip::params {

  anchor {'geoip::begin':
    before => Class['geoip::install']
  }
  class {'geoip::install':
    require => Anchor['geoip::begin']
  }
  class {'geoip::config':
    require => Class['geoip::install']
  }
  anchor {'geoip::end':
    require => Class['geoip::config']
  }
}
