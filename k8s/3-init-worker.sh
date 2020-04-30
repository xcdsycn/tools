#!/bin/bash
# 只在 master 节点执行
#kubeadm token create --print-join-command

# 只在 worker 节点执行
# 替换 x.x.x.x 为 master 节点的内网 IP
export MASTER_IP=192.168.10.165
# 替换 apiserver.demo 为初始化 master 节点时所使用的 APISERVER_NAME
export APISERVER_NAME=apiserver.admin.df
echo "${MASTER_IP}    ${APISERVER_NAME}" >> /etc/hosts

# 替换为 master 节点上 kubeadm token create 命令的输出
kubeadm join apiserver.admin.df:6443 --token 17gfp1.w1neeo4kksriq4n1     --discovery-token-ca-cert-hash sha256:6e981db96db178f215c9b14c942140ea80db9c5125dcc0f5f18fe543e8193de6

