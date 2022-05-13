#! /bin/bash

echo "[TASK 1] Enable ssh password authentication"
sed -i 's/^PasswordAuthentication .*/PasswordAuthentication yes/' /etc/ssh/sshd_config
echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
systemctl reload sshd

echo "[TASK 2] Set root password"
echo -e "kubeadmin\nkubeadmin" | passwd root >/dev/null 2>&1

echo "[TASK 3] Update /etc/hosts file"
cat >>/etc/hosts<<EOF
172.16.0.100   control-plane.dev.io   control-plane
172.16.0.101   node1.dev.io           node1
172.16.0.102   node2.dev.io           node2
EOF