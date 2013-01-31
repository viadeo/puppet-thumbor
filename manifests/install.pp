# = Class: thumbor::install
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
class thumbor::install {
  package{ ['thumbor']:
    ensure => present
  }
}
