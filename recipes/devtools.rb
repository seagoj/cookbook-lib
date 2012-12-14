include_recipe 'cookbook-lib'
lib = '/vagrant/lib'
docRoot = '/vagrant/src'

git "#{lib}" do
  not_if {File.exists?("#{lib}/Devtools")}
  repository "git@github.com:seagoj/devtools.git"
  reference "master"
  action :checkout
end

File.copy "#{lib}/Devtools/dep/autoloader.php #{docRoot}"
