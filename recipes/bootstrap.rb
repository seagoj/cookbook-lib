include_recipe 'lib'

git "#{node[:lib][:lib_dir]}/Bootstrap" do
  not_if {File.exists?("#{node[:lib][:lib_dir]}/bootstrap")}
  repository "git://github.com/twbs/bootstrap.git"
  reference "master"
  action :checkout
end
