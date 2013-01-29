# Reusable Puppet config for Vagrant

This provides a very simple example that shows how you can reuse
[Puppet][puppet] configuration between [Vagrant][vagrant] and your non-Vagrant
systems, including data lookup via Hiera.

Tested with Puppet 3.0.2.

## Vagrant

The Vagrant-specific configuration is captured in the `Vagrantfile`.  The
resulting Puppet invocation is
    
    cd /tmp/vagrant-puppet/manifests \
    && FACTER_is_vagrant='true' puppet apply \
        --hiera_config hiera.yaml \
        --modulepath '/tmp/vagrant-puppet/modules-0' \
        /tmp/vagrant-puppet/manifests/default.pp

When provisioned (via `vagrant up` or `vagrant provision`) you will see the
following on the console:

    Notice: role::ui configured for vagrant; hostname: 192.168.42.42

## Other environments

A sample `puppet_apply.sh` script is included in the `puppet` directory.  All
that is required is to clone this repository (or otherwise make the files
available on the target system).

## Tweaks

### `is_vagrant` fact

This could be replaced with the direct definition of a `data_center` fact.

### Vagrant shell provisioner

Vagrant takes care of providing mounts for the manifests and modules, so the
configuration would only get shuffled around a bit, but it's possible to
directly invoke `puppet_apply.sh` from Vagrant.

### `hieradata` path messiness

There's no way to provide variables to Hiera for path expansion other than via
Puppet itself.  It's a bit chicken-and-eggy.  The provided `hiera.yaml` uses a
relative path to the `hieradata` directory that is compatible with the Vagrant
invocation of Puppet, and the example `puppet_apply.sh` similarly takes care of
the path munging, but it doesn't feel all that clean to me.

[puppet]: http://puppetlabs.com
[vagrant]: http://vagrantup.com
