# ISPmail Bookworm Ansible Playbook

This repository contains an Ansible playbook and roles to help set up a mail servers.
Please see the instructions at https://workaround.org/ispmail-bookworm

You will find support in the comment section on that web site. Or try our chat
room at https://riot.im/app/#/room/#ispmail:matrix.org

# Usage

Prepare a (new) server with Debian Bullseye.

Install Ansible and Git:

    apt install ansible git

Check that you can login to your new server as root:

    ssh root@[IP address of the server]

Clone this Git repository to your local computer.

    git clone https://github.com/Signum/ispmail-bookworm-ansible.git

Add your mail server to the _hosts_ file with its IP address (this is just an example):

    my.mail.server ansible_ssh_host=[IP address of the server]

Edit the file `ansible/group_vars/all` to suit your needs (domain name, admin IP addresses, etc.)

…and run:

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
