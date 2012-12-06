include_recipe 'cookbook-lib'

git "#{lib}/temp" do
  not_if {File.exists?("#{lib}/bootstrap")}
  repository "git://github.com/twitter/bootstrap.git"
  reference "master"
  action :checkout
end