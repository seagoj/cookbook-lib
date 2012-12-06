include_recipe 'cookbook-lib'
lib = '/vagrant/lib'

git "/vagrant/lib/temp" do
  not_if {File.exists?('/vagrant/lib/predis')}
  repository "git://github.com/nrk/predis.git"
  reference "master"
  action :checkout
end
  
execute "mkdir-lib" do
  not_if {File.exists?('/vagrant/lib/predis')}
  command "mkdir /vagrant/lib/predis"
end
  
execute "copy-to-lib" do
  not_if {File.exists?('/vagrant/lib/predis')}
  command "cp -r /vagrant/lib/temp/lib/Predis /vagrant/lib"
end
  
execute "rm-temp" do
  not_if {!File.exists?('/vagrant/lib/temp')}
  command "rm -r /vagrant/lib/temp"
end