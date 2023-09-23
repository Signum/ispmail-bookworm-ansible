# ISPmail Bookworm Ansible Playbook

This repository contains an Ansible playbook and roles to help set up a mail servers.
Please see the instructions at https://workaround.org/ispmail-bookworm

You will find support in the comment section on that web site. Or try our chat
room at https://riot.im/app/#/room/#ispmail:matrix.org

# Usage

## Run from your Linux laptop

Make sure you have Ansible and Git installed:

    apt install git ansible

Check that you can login to your new server as root:

    ssh root@65.21.191.129

Clone this repo to your local computer.

    git clone https://github.com/Signum/ispmail-bookworm-ansible.git

Add your mail server to the _hosts_ file with its IP address (this is just an example):

    my.mail.server ansible_ssh_host=65.21.191.129

Edit the file `ansible/group_vars/all` to suit your needs (domain name, admin IP addresses, etc.)

…and run:

    cd ispmail-bookworm-ansible/ansible
    ansible-playbook ispmail.yml -l my.mail.server

At the end of the playbook you will get a report like:

    "Installation complete.",
    "",
    "Web mail URL:            https://mail.example.com/",
    "Example email user:      john@example.com",
    "Example email password:  summersun",
    "Rspamd admin URL:        https://example.com/rspamd",
    "Rspamd admin password:   eiPh4yohghaequuviehiePoh5zeaj"
    "DKIM public key :        20230619._domainkey IN TXT ( \"v=DKIM1; k=rsa; \"\n\t\"p=Ze_VERY_LONG_DKIM_KEY_DAQAB\" ) ;"


## Run from the new mail server itself

Same as above. But run this command on the server:

    ansible-playbook ispmail.yml -c local

# What will this do ?

- Install all necessary packages and configure them 
- Require and install a SSL certificate from Let's encrypt
- Configure DKIM signing and provide you the public key

# Vagrant

Deploying a new VM or hardware server time and again to test these playbooks
is tedious. A better way is to use Vagrant and VirtualBox. Install both
and run…

    vagrant up

…from this repository. The ports of your mail server are mapped to localhost
on your system. Check out the Vagrantfile to see the port mapping.

# License

Everything in this repository can be freely used under the terms of the MIT license.
