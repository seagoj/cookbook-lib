include_recipe 'cookbook-lib'
lib = '/vagrant/lib'

git "#{lib}" do
  not_if {File.exists?("#{lib}/bootstrap")}
  repository "git://github.com/twitter/bootstrap.git"
  reference "master"
  action :checkout
end