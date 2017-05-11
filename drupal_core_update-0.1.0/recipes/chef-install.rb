script 'download chef-dk package' do
        interpreter 'bash'
        code <<-EOH
        cd /tmp
        wget https://packages.chef.io/files/stable/chefdk/1.2.20/ubuntu/14.04/chefdk_1.2.20-1_amd64.deb
        EOH
        not_if "chef env"
end

script 'download chef-dk package' do
        interpreter 'bash'
        code <<-EOH
        sudo dpkg -i /tmp/chefdk_1.2.20-1_amd64.deb
        EOH
        not_if "chef env"
end

include_recipe 'drupal_core_update::install_docker.rb'
