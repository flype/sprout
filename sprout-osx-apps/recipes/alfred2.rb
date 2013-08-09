unless File.exists?("/Applications/Alfred\ 2.app")
  remote_file "#{Chef::Config[:file_cache_path]}/Alfred_2.0.7_205.zip" do
    source "http://cachefly.alfredapp.com/Alfred_2.0.7_205.zip"
    mode "0644"
  end

  execute "unzip alfred2" do
    command "unzip #{Chef::Config[:file_cache_path]}/Alfred_2.0.7_205.zip 'Alfred 2.app'/* -d /Applications/"
    user node['current_user']
    group "admin"
  end
end
