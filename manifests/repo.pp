# Class: hadoop::repo
#
# This module manages hadoop
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
class thumbor::repo {

#   apt::ppa { "ppa:thumbor/ppa": }

  apt::source {'globo_repository':
    location    => "http://ppa.launchpad.net/thumbor/ppa/ubuntu/",
    release     => "precise",
    repos       => 'main',
    key         => '1225313B',
    include_src => false,
  }

}

