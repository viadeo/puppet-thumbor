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


