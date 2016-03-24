# = Class: thumbor::install::apt
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
class thumbor::install::apt {
  package{ ['thumbor']:
    ensure => present
  }
}
