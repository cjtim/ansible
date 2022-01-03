
## Step
1. Create `ansible` user and add `ANSIBLE_SSH_PUB_KEY` to `authorized_keys`
2. Install `Docker` 
3. Clone repositoy and `docker-compose up`

## Prerequisite
* Ansible >= 2.12
* Ansible inventory file `hosts.yml`
* Private key for root user
* Public key for `ansible` user


## Environment variables
| ENV |  | Mandatory | Default
|--|--|--|--|
| `ANSIBLE_INVENTORY_BASE64` | Ansible inventory file in yaml format | yes | `""` |
| `SSH_KEY` | For login into server | yes | `""` |
| `ANSIBLE_SSH_PUB_KEY` | SSH Public key for `ansible` user **`playbooks/1-add-user.yml`** | no | `""` |
| `GIT_PASSWORD` | to clone repositoy **`playbooks/3-deploy-docker-compose.yml`** | no | `""` |


## Deploy
```shell
export ANSIBLE_INVENTORY_BASE64=$(base64 < hosts.yml)
export SSH_KEY=$(cat ~/.ssh/id_rsa)
export ANSIBLE_SSH_PUB_KEY=$(cat ~/.ssh/id_rsa.pub)
export GIT_PASSWORD=""
./deploy.sh
```