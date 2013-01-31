puppet-thumbor
==============

Puppet module to deploy Thumbor http://github.com/globocom/thumbor

this module depends on https://forge.puppetlabs.com/puppetlabs/apt to configue PPA repo https://launchpad.net/~thumbor/+archive/ppa

To test it with vagrant http://www.vagrantup.com/

```
mkdir modules
puppet module install -i ./modules puppetlabs/apt
git clone git://github.com/dhardy92/puppet-thumbor.git modules/thumbor
cd modules/thumbor/tests
vagrant up
```

Now go on your favorite browser and open http://127.0.0.1:8888/unsafe/200x200/http://farm9.staticflickr.com/8145/7474160854_1f963b155d_o.jpg (as an example)

How to use it in your manifest
------------------------------

Default configuration of your instance of Thumbor:
```
include thumbor
```
is equivalent to

```
class { 'thumbor':
  security_key => 'MY_SECURE_KEY',
  port => '8888',
  ip => '0.0.0.0',
  config => {},
  conffile => '/dev/null'
}
```

Configuration
-------------

  * `security_key` to use thumbor signed API ( cf. https://github.com/globocom/thumbor/wiki/Security )
  * `port` to set listening ports of thumbor instances (multiple ports can be precises separated by coma: 1 port = 1 thumbor instance)
  * `ip` to set the listening ip for all thumbor instances
  * `config` a hash to set config parameters ( Ex. : config => { 'MAX_WIDTH' => 800, 'MAX_HEIGHT' => 800, 'STORAGE'=> 'thumbor.storage.no_storage' } ). You can refer to Thumbor wiki for configuration options https://github.com/globocom/thumbor/wiki/Configuration 
  * `conffile` a file used as template to prepend the default config (empty, only for documentation purpose)
