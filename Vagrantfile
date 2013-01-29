# -*- mode: ruby -*-

Vagrant::Config.run do |config|
    # Every Vagrant virtual environment requires a box to build off of.
    config.vm.box = "CentOS-6.3-x86_64-reallyminimal"

    # The url from where the 'config.vm.box' box will be fetched if it
    # doesn't already exist on the user's system.
    config.vm.box_url = "https://s3.amazonaws.com/1412126a-vagrant/CentOS-6.3-x86_64-reallyminimal.box"

    # Assign this VM to a host-only network IP, allowing you to access it
    # via the IP.
    config.vm.network :hostonly, "192.168.42.42"

    # Enable provisioning with Puppet stand alone.
    config.vm.provision :puppet do |puppet|
        ## tell Puppet where to find the hiera config
        puppet.options = "--hiera_config hiera.yaml"

        ## boilerplate Vagrant/Puppet config
        puppet.manifests_path = "puppet/manifests"
        puppet.manifest_file = "default.pp"
        puppet.module_path  = "puppet/modules"

        ## custom facts provided to Puppet
        puppet.facter = {
            ## tells default.pp that we're running in Vagrant
            "is_vagrant" => true,
        }
    end
end
