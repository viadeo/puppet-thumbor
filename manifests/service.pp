# = Class: thumbor::service
#
# This module manages thumbor
#
# == Parameters:
#
# == Actions:
#
# == Requires:
#
# == Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class thumbor::service {
  service {"thumbor":
    require => File['/etc/thumbor.conf',
                    '/etc/thumbor.key',
                    '/etc/default/thumbor'],
    ensure  => running,
    subscribe => File['/etc/thumbor.conf',
                    '/etc/thumbor.key',
                    '/etc/default/thumbor'],
  }
}
