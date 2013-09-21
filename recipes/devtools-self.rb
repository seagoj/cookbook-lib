

unless File.exists?("#{node[:lib][:lib_dir]}/Devtools")
    unless File.exists?(node[:lib][:lib_dir])
        Directory node[:lib][:lib_dir] do
            owner node[:lib][:user]
            group node[:lib][:group]
            action :create
        end
    end

    execute "link to files" do
        cwd node[:lib][:lib_dir]
        user node[:lib][:user]
        group node[:lib][:group]
        command "ln -s #{node[:lib][:doc_root]} #{node[:lib][:lib_dir]}/Devtools"
    end
end
