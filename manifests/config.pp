# = Class: thumbor::config
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
class thumbor::config {
  file {'/etc/default/thumbor':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    content=> template('thumbor/default.erb'),
  }
  file {'/etc/thumbor.conf':
    ensure => present,
    owner  =>'root',
    group  => 'root',
    mode   => '0644',
    content=> template($thumbor::conffile,'thumbor/thumbor.conf.erb')
  }
  file {'/etc/thumbor.key':
    ensure => present,
    owner  => 'thumbor',
    group  => 'thumbor',
    mode   => '0600',
    content=> $thumbor::security_key,
  }
}
