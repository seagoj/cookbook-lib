include_recipe 'lib'

git "#{ndoe[:lib][:lib_dir]}/temp" do
  not_if {File.exists?("#{node[:lib][:lib_dir]}/Predis")}
  repository "git://github.com/nrk/predis.git"
  reference "master"
  action :checkout
end
  
directory "#{node[:lib][:lib_dir]}/Predis" do
    not_if {File.exists?({node[:lib][:lib_dir]})}
    owner node[:lib][:user]
    group node[:lib][:group]
    action :create
end

execute "copy-to-lib" do
  command "cp -r #{node[:lib][:lib_dir]}/temp/lib/Predis #{node[:lib][:lib_dir]}"
end
  
directory "#{node[:lib][:lib_dir]}/temp" do
    action :delete
end
