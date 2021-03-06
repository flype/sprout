unless File.exists?("/Applications/Knox.app")
  remote_file "#{Chef::Config[:file_cache_path]}/Knox-2.2.0.zip" do
    source "https://d13itkw33a7sus.cloudfront.net/dist/K/Knox-2.2.0.zip"
    mode "0644"
  end

  execute "unzip knox" do
    command "unzip #{Chef::Config[:file_cache_path]}/Knox-2.2.0.zip Knox.app/* -d /Applications/"
    user node['current_user']
    group "admin"
  end
end
