# = Class: thumbor
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
class thumbor ( 
  $security_key='MY_SECURE_KEY', 
  $port='8888', 
  $ip='0.0.0.0', 
  $config = {}, 
  $conffile = '/dev/null',
  $install_method = 'apt'
) {

    ## Modules
    include thumbor::config
    include thumbor::service

    ## Ordering
    Class['thumbor::config']
    ~> Class['thumbor::service']

    if $install_method == 'apt' {
        include thumbor::repo
        include thumbor::install::apt
        Class['thumbor::repo'] -> Class['thumbor::install::apt'] -> Class['thumbor::config']
    } elsif $install_method == 'pip' {
        include thumbor::install::pip
        Class['thumbor::install::pip'] -> Class['thumbor::config']
    } else {
        fail("install_method must be 'apt' or 'pip'")
    }
}
