#!/bin/sh

TMP_FILE=tmp_hosts.yml
TMP_SSH=tmp_id_rsa

if [ -z "$ANSIBLE_INVENTORY_BASE64" ]; then
    echo "Please set ANSIBLE_INVENTORY_BASE64 variable"
    echo -----
    echo 'ANSIBLE_INVENTORY_BASE64=$(base64 < hosts.yml) ./deploy.sh'
    exit 1
fi

echo "$SSH_PUB_KEY"

echo "$ANSIBLE_INVENTORY_BASE64" | base64 -d > $TMP_FILE
echo "$SSH_KEY" > $TMP_SSH
chmod 600 $TMP_SSH

# run playbook
ls playbooks | xargs -I {} ansible-playbook playbooks/{} --inventory=$TMP_FILE

# cleanup
rm -f $TMP_FILE $TMP_SSH