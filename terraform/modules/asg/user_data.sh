#!/bin/bash

installPreReq() {
    yum install -y epel-release
    yum install -y jq
    echo "Installing AWS CLI"
    curl -O https://bootstrap.pypa.io/get-pip.py
    python get-pip.py
    pip install awscli

    echo "Installing Ansible"
    yum install ansible    
}

main() {
    installPreReq
}