#
# Cookbook:: kubernetes
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

#include_recipe 'docker'

yum_repository "kubernetes" do
  description "Kubernetes Repo"
  baseurl "https://packages.cloud.google.com/yum/repos/kubernetes-el7-\$basearch"
  gpgkey "https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg"
  action :create
  enabled true
end

execute "permissive_selinux" do
  command 'setenforce 0'
  only_if 'getenforce | grep enforcing'
end

bash "fix issue with iptables" do
  code <<-EOH
    cat <<EOF >  /etc/sysctl.d/k8s.conf
    net.bridge.bridge-nf-call-ip6tables = 1
    net.bridge.bridge-nf-call-iptables = 1
    EOF
  EOH
  not_if 'grep net.bridge-nf /etc/sysctl.d/k8s.conf'
end

package %w(kubelet, kubeadm, kubectl) do
end

service %w(kubelet, kubeadm, kubectl) do
  action [:enable, :start]
end

