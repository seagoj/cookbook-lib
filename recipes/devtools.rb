include_recipe 'cookbook-lib'
require 'fileutils'
lib = '/vagrant/lib'
docRoot = '/vagrant/src'

git "#{lib}/Devtools" do
  not_if {File.exists?("#{lib}/Devtools")}
  repository "git://github.com/seagoj/devtools.git"
  reference "master"
  action :checkout
end

# system("git clone git@github.com:seagoj/devtools.git #{lib}/Devtools")
# FileUtils.copy("#{lib}/Devtools/dep/autoloader.php", "#{docRoot}")
\
