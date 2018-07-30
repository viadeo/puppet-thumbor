class thumbor::install::pip {

  package { ['libwebp-dev',
    'python-statsd',
    'python-crypto',
    'libjpeg-dev',
    'libjpeg8-dev',
    'libpng12-dev',
    'libtiff5-dev',
    'python-numpy',
    'python-opencv',
    'libcurl4-openssl-dev'
  ]: }

  -> package { 'colour':
    provider => 'pip'
  }

  -> package { 'thumbor':
    provider => 'pip',
    ensure => '5.2.1'
  }

  -> package { 'opencv-engine':
    provider => 'pip',
  }

  file {'/etc/init/thumbor.conf':
    ensure => present,
    owner  => root,
    group  => root,
    mode   => 0644,
    source => 'puppet:///modules/thumbor/init/thumbor.conf',
    notify => Class['thumbor::service'],
  }

  file {'/etc/init/thumbor-worker.conf':
    ensure => present,
    owner  => root,
    group  => root,
    mode   => 0644,
    source => 'puppet:///modules/thumbor/init/thumbor-worker.conf',
    notify => Class['thumbor::service'],
  }

  group { 'thumbor':
    system => true,
    ensure => present
  }

  user { 'thumbor':
    system => true,
    gid => 'thumbor',
    home => '/var/lib/thumbor',
    require => Group['thumbor']
  }

  file { '/var/lib/thumbor':
    ensure => directory,
    owner => 'thumbor',
    group => 'thumbor',
    mode => 0755
  }
 
}
