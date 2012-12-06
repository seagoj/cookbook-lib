execute "apt-update" do
    command "apt-get update"
end

package 'git'

lib = '/vagrant/lib'

unless(File.exists?(lib))
    Dir.mkdir(lib)
end
