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
case $thumbor_service_provider {
    'systemd': {
      file { '/etc/systemd/system/thumbor-service.cfg':
        ensure  => $newrelic_php_service_ensure,
        content => template('thumbor/thumbor.service.erb'),
      }~>
      exec { 'thumbor-systemd-reload':
        command     => 'systemctl daemon-reload',
        path        => [ '/usr/bin', '/bin', '/usr/sbin', '/usr/local/bin/' ],
        refreshonly => true,
      }
    }
    default: {}
  }


class thumbor::service {
  service {"thumbor":
    require => File['/etc/thumbor.conf',
                    '/etc/thumbor.key',
                    '/etc/default/thumbor'],
    provider   => thumbor_service_provider,
    hasrestart => true,
    hasstatus  => true,
  }
}
