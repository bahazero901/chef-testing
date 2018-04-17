#
# Cookbook:: kubernetes
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

include_recipe 'docker'

yum_repository "kubernetes" do
  description "Kubernetes Repo"
  baseurl "https://packages.cloud.google.com/yum/repos/kubernetes-el7-\$basearch"
  gpgkey "https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg"
  action :create
  enabled true
end

execute "permissive_selinux" do
  command 'setenforce 0'
  only_if 'getenforce | grep Enforcing'
end

bash "fix issue with iptables" do
  code <<-EOH
    cat <<EOF >  /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
  EOH
  only_if 'grep net.bridge-nf /etc/sysctl.d/k8s.conf'
end


=begin
  Installing : kubectl-1.10.0-0.x86_64                                      1/5
  Installing : socat-1.7.3.2-2.el7.x86_64                                   2/5
  Installing : kubelet-1.10.0-0.x86_64                                      3/5
  Installing : kubernetes-cni-0.6.0-0.x86_64                                4/5
  Installing : kubeadm-1.10.0-0.x86_64
=end

package %w(kubelet kubeadm kubectl) do
  action :install
  notifies :enable, 'service[kubelet]'
  notifies :start, 'service[kubelet]'
end

service 'kubelet' do
  action :nothing
  #action [:enable, :start]
end

