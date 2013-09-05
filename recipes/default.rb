include_recipe 'apt'
package 'git'

unless(File.exists?(node[:lib][:lib_dir]))
    Dir.mkdir(node[:lib][:lib_dir])
end
