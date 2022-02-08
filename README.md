
## Step
1. Create `ansible` user and add `ANSIBLE_SSH_PUB_KEY` to `authorized_keys`
2. Install `Docker` 
3. Clone repositoy and `docker-compose up`

## Prerequisite
* Ansible >= 2.12
* *Ansible inventory file `hosts.yml` in root of repo
* Private key for root user
* Public key for `ansible` user


## Environment variables
| ENV |  | Mandatory | Default
|--|--|--|--|
| `ANSIBLE_CONFIG` | Ansible config location `ansible.cfg` | yes | `""` |
| `ANSIBLE_PRIVATE_KEY_FILE` | SSH Private key path to login server as `root` | yes | `""` |
| `ANSIBLE_SSH_PUB_KEY` | SSH Public key for `ansible` user for **users** | no | `""` |
| `GIT_REPO` | for **docker_compose_service** | no | `""` |
| `GRAFANA_API_KEY` | for **monitor** | no | `""` |
| `GRAFANA_ID` | for **monitor** | no | `""` |


## Deploy
```shell
export ANSIBLE_CONFIG=ansible.cfg
export ANSIBLE_PRIVATE_KEY_FILE=~/.ssh/id_rsa
export ANSIBLE_SSH_PUB_KEY=$(cat ~/.ssh/id_rsa.pub)
export GIT_REPO=""
export GRAFANA_API_KEY=""
export GRAFANA_ID=""
ansible-playbook main.yml --tags users --tags docker --tags docker_compose_service
```
