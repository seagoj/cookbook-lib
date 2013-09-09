include_recipe 'apt'
package 'git'

directory node[:lib][:lib_dir] do
    not_if {File.exists?(node[:lib][:lib_dir])}
    owner node[:lib][:user]
    group node[:lib][:group]
    action :create
end
