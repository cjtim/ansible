#!/bin/sh

TMP_FILE=tmp_hosts.yml

if [ -z "$ANSIBLE_INVENTORY_BASE64" ]; then
    echo "Please set ANSIBLE_INVENTORY_BASE64 variable"
    echo -----
    echo 'ANSIBLE_INVENTORY_BASE64=$(base64 < hosts.yml) ./deploy.sh'
    exit 1
fi

echo "$ANSIBLE_INVENTORY_BASE64" | base64 -d > $TMP_FILE

# run playbook
ls playbooks | xargs -I {} ansible-playbook playbooks/{} --inventory=$TMP_FILE

# cleanup
rm -f $TMP_FILE