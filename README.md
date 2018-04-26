# puppet-geoip

Puppet manifest to install and configure MaxMind GeoIP Legacy

[![Build Status](https://secure.travis-ci.org/icalvete/puppet-geoip.png)](http://travis-ci.org/icalvete/puppet-geoip)

See [MaxMind site](http://dev.maxmind.com/geoip/legacy/geolite/)


This manifest install GeoIP (Country Level) and GeoLiteCity (City Level) databases

## Usage

By default in /opt/geoip

```puppet
include geoip
```

```puppet
class {'geoip':
  root_path => '/srv/geoip/'
}
```

## Update

This manifest also install crons to update databases.

## Authors:

Israel Calvete Talavera <icalvete@gmail.com>
