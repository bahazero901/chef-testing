#
# Cookbook:: kubernetes
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

include_recipe 'docker'

yum repository "kubernetes" do
  description "Kubernetes Repo"
  baseurl "https://packages.cloud.google.com/yum/repos/kubernetes-el7-\$basearch"
  gpgkey "https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg"
  action :create
  enabled True
end

[kubelet, kubeadm, kubectl].each do |pkg|
  package pkg do
  end
end

[kubelet, kubeadm, kubectl].each do |svc|
  service svc do
    action [:enabled, :start]
  end
end

execute "permissive_selinux"
  command 'setenforce 0'
#  only_if 
end

bash "fix issue with iptables"
  code <<-EOH
    cat <<EOF >  /etc/sysctl.d/k8s.conf
    net.bridge.bridge-nf-call-ip6tables = 1
    net.bridge.bridge-nf-call-iptables = 1
    EOF
  not_if 'grep net.bridge-nf /etc/sysctl.d/k8s.conf' 
end
