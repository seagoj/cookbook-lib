include_recipe 'lib'
lib = '/vagrant/lib'

git "#{lib}/bootstrap" do
  not_if {File.exists?("#{lib}/bootstrap")}
  repository "git://github.com/twitter/bootstrap.git"
  reference "master"
  action :checkout
end
