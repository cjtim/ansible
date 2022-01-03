#!/bin/sh

DEFAULT_ID_RSA_PATH=~/.ssh/id_rsa

TMP_INVENTORY_FILE=tmp_hosts.yml
TMP_SSH_FILE=tmp_id_rsa

if [ -z "$ANSIBLE_INVENTORY_BASE64" ]; then
    echo "Please set ANSIBLE_INVENTORY_BASE64 variable"
    echo -----
    echo 'ANSIBLE_INVENTORY_BASE64=$(base64 < hosts.yml) ./deploy.sh'
    exit 1
fi
echo "$ANSIBLE_INVENTORY_BASE64" | base64 -d > $TMP_INVENTORY_FILE

# lookup for private key and store in file
# set properly permission 
if [ -z "$SSH_KEY" ]; then
    SSH_KEY=$(cat $DEFAULT_ID_RSA_PATH)
    export SSH_KEY
fi
echo "$SSH_KEY" > $TMP_SSH_FILE
chmod 600 $TMP_SSH_FILE

# run playbook
# ls playbooks | xargs -I {} ansible-playbook playbooks/{} --inventory=$TMP_INVENTORY_FILE

ansible-playbook $1 --inventory=$TMP_INVENTORY_FILE

# cleanup
rm -f $TMP_INVENTORY_FILE $TMP_SSH_FILE