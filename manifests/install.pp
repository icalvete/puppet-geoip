class geoip::install {

  file { 'geoip_root_path':
    ensure => directory,
    path   => $geoip::root_path,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  exec { 'download_geoip_database':
    command  => "/usr/bin/curl -s http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz | /bin/gunzip > ${geoip::root_path}/GeoIP.dat",
    user     => 'root',
    provider => 'shell',
    require  => File['geoip_root_path']
  }

  exec { 'download_geoip_city_database':
    command  => "/usr/bin/curl -s http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz | /bin/gunzip > ${geoip::root_path}/GeoLiteCity.dat",
    user     => 'root',
    provider => 'shell',
    require  => File['geoip_root_path']
  }

  cron { 'update__geoip_database':
    command => "/usr/bin/flock /tmp/update_geoip_database /usr/bin/curl -s http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz | /bin/gunzip > ${geoip::root_path}/GeoIP.dat",
    user    => 'root',
    hour    => '0',
    minute  => '0',
    weekday => '7'
  }

  cron { 'update__geoip_city_database':
    command => "/usr/bin/flock /tmp/update_geoip_database /usr/bin/curl -s http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz | /bin/gunzip > ${geoip::root_path}/GeoLiteCity.dat",
    user    => 'root',
    hour    => '0',
    minute  => '0',
    weekday => '7'
  }
}
