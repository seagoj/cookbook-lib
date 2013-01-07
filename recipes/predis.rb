include_recipe 'lib'
lib = '/vagrant/lib'

git "#{lib}/temp" do
  not_if {File.exists?("#{lib}/Predis")}
  repository "git://github.com/nrk/predis.git"
  reference "master"
  action :checkout
end
  
execute "mkdir-lib" do
  not_if {File.exists?("#{lib}/Predis")}
  command "mkdir #{lib}/Predis"
end
  
execute "copy-to-lib" do
  not_if {File.exists?("#{lib}/Predis")}
  command "cp -r #{lib}/temp/lib/Predis #{lib}"
end
  
execute "rm-temp" do
  not_if {!File.exists?("#{lib}/temp")}
  command "rm -r #{lib}/temp"
end
