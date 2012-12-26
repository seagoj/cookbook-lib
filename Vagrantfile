Vagrant::Config.run do |config|
  cookbook_location = 'remote'

  cookbooks = {
    'apt'=>'git@github.com:seagoj/cookbook-apt.git',
    'cookbook-lib'=>'git@github.com:seagoj/cookbook-lib.git',
    'cookbook-lib::predis'=>'git@github.com:seagoj/cookbook-lib.git',
    # 'cookbook-lib::bootstrap'=>'git@github.com:seagoj/cookbook-lib.git',
    # 'cookbook-lib::devtools'=>'git@github.com:seagoj/cookbook-lib.git'
  }
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.network :bridged
  config.vm.forward_port 80, 8080
  config.vm.forward_port 6379, 6379
  
  config.vm.provision :chef_solo do |chef|
     chef.cookbooks_path = 'cookbooks'  

    case cookbook_location
    when 'local'
      
    when 'remote'
      unless File.exists?('cookbooks')
        Dir.mkdir('cookbooks')
      end
     cookbooks.each do |k,v|
        command = 'git clone '+v+' cookbooks/'
        if k.index(':')
          command += k[0,k.index(':')]
        else
          command += k
        end
          system(command)
          chef.add_recipe(k)
      end
    end
  end
end
