# == Class: memcached::params
#
class thumbor::params {
  case $::osfamily {
    'Debian': {
      case $install_method {
        'pip': {
          $security_key='MY_SECURE_KEY',
          $port='8888',
          $ip='0.0.0.0',
          $config = {},
          $conffile = '/dev/null',
          $install_method = 'pip'
        }
        default: {
          $security_key='MY_SECURE_KEY',
          $port='8888',
          $ip='0.0.0.0',
          $config = {},
          $conffile = '/dev/null',
          $install_method = 'apt'
        }
      }
    }
    default: {
      fail("Unsupported platform: ${::osfamily}/${::operatingsystem}")
    }
  }
}

