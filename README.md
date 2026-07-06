# Automation and Infrastructure Project
This is the first step of my file project, where I applied my knowledge of ansible scripts and created a terraform template file to
deploy a server, install docker and docker compose, then copy an exists compose file and configured ssh settings with a new user.

## Ansible Playbooks
**serversetup.yaml**
> This will do the following: Disable ssh password authentication in sshd_config, Install docker, Create a directory for the docker-compose file,
> copy the compose file from the host device, then run the docker compose file.

Specific Instructions: The directory is currently coded into the playbook, modify the path before running.

**sshharden.yaml**
> This will do the following: Prompt the user for a password and create a new user in sudo group, create the .ssh directory and copy the
> ssh pubkey onto the new users directory, disable root login in the sshd_config then restart ssh.

Specific Instructions: User name is already defined, modify it to the current user in the host device connected to.

**ufwconfig.yaml**
>This will do the following: Install ufw, set default to be deny incoming allow outgoing, and then allow OpenSSH, port 80 and port 443.
>Will lastly reload ssh service.

Specific Instructions: Since user has a password set, add -K when running playbook to ask for password.

**Running playbooks**
Make sure to create an inventory file with the server ip, along with setting the correct user (root,username), Then run:

```
ansible-playbook -i inventory.ini playbook.yaml
(add -K option if password is required)
```

## Docker Compose file
This docker compose file has set to install grafana at port 3000, grafana loki at port 3100 and nginx at port 80.
