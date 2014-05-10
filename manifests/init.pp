# Class: apt_cacher_ng
#
# This module manages apt-cacher-ng
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class apt_cacher_ng(
  $proxy = ''                 # e.g. http://192.168.0.17:3142
) {

  package { apt-cacher-ng: ensure => installed }
  service { apt-cacher-ng:
  	enable    => true,
  	ensure    => running,
  	subscribe => Package['apt-cacher-ng'],
  }
  file { '/etc/apt-cacher-ng/acng.conf':
  	content => template('apt_cacher_ng/acng.conf.erb'),
  	mode    => 0644,
  	require => Package['apt-cacher-ng'],
  	notify  => Service['apt-cacher-ng'],
  }

}
