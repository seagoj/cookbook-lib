include_recipe 'lib'
require 'fileutils'
docRoot = '/vagrant/src'

git "#{node[:lib][:lib_dir]}/Devtools" do
  not_if {File.exists?("#{node[:lib][:lib_dir]}/Devtools")}
  repository "git://github.com/seagoj/Devtools.git"
  reference "master"
  action :checkout
end

execute "Copy Autoloader" do
    execute "cp #{node[:lib][:lib_dir]}/Devtools/dep/autoloader.php #{node[:lib][:doc_root]}"
end
