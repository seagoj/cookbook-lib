include_recipe 'lib'
lib = '/vagrant/lib'
docRoot = '/vagrant/src'

git "#{lib}" do
  not_if {File.exists?("#{lib}/Devtools")}
  repository "git@github.com:seagoj/devtools.git"
  reference "master"
  action :checkout
end

File.cp "#{lib}/Devtools/dep/autoloader.php #{docRoot}"