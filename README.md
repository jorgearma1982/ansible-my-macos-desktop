# Ansible for my work macos desktop

## Introduction

I love GNU/Linux and I miss it every time I have to use MacOS for work tasks, so I wrote this guide so I can have 
a repetible procedure to setup my developer workspace using most of the GNU programs I love on MacOS.

We are automating the post-setup process which is all the tasks we run after installing MacOS from scratch.

### Objectives

The main objective is to automatically execute the tasks in the post-setup process, personally I run this tasks
every time after installing the operating system. We are going to use ansible to deploy:

 * homebrew core packages
 * homebrew cask packages
 * Install GNU CLI Utils
   * wget
   * curl
   * openssl
   * readline
   * ssh-copy-id
   * nmap
   * gettext
   * gpg2
   * mcrypt
   * autoconf
   * make
 * Install third party tools
   * oh-my-zsh
   * firefox
   * kitty
 * Install Virtualization & Cloud Toolkit
   * virtualbox
   * vagrant
   * gcloud
   * awscli
   * packer
   * terraform
   * docker
   * kubectl
   * helm
   * drone
 * Install dotfiles
 
## Requirements

We are going to run all this procedures from the command line, so *bash* is required, we also need a stable
Internet connection to download all packages.

## Cloning the repository

First we need to go the directory we are going to work, and clone the repository
from gitlab, for example:

```
$ mkdir ~/data/vcs
$ cd ~/data/vcs
$ git clone https://github.com/jorgearma1982/ansible-my-macos-desktop
$ cd ansible-my-macos-desktop
```

## Installing and Testing Ansible

In order to install ansible, you need to run **bin/install-ansible-on-macos.sh**,
for example:

```
$ sudo bin/install-ansible-on-macos.sh
```

This scripts tests localhost connection at the end.

## Validating local conection

Now run ansible with local connection to localhost.

```
$ ansible 127.0.0.1 -c local -m ping
```

Go to next section to run playbooks.

## The playbook

The main playbook is **localsystem.yml**, let's display it:

```
$ cat localsystem.yml
---
#
# Playbook: Local System
#

- hosts: localhost
  connection: local
  user: macos
  become: yes
  roles:
    - common

```

## Running the Ansible playbook

Before you run ansible, plase edit localsystem.yml playbook file, change the
variable **user** with your own username, for example:

```
$ sed -i 's/ubuntu/jmedina/' localsystem.yml
```
So, it looks like this:

```
- hosts: localhost
  connection: local
  user: jmedina
  become: yes
```

As you could see in the playbook header, we connect to localhost with the local
user jmedina and use sudo to gain privileges, note that **become** replaces the
old **sudo** parameter.

## Running only a group of tasks using tags

If you remember, in the main playbook localsystem.yml we use roles to group
task associated to a program, I have tagged every task in the different playbooks
for each role, so if you want to run only  the task asociated to a rol, use the
**--tags** with a comma separaed list of tags.

Each role includes more that one task, some of the are grouped, task on a role
can include more than one tag, here are the main tags:

 * **common:** system_settings

Now run ansible with a few simple tasks for system settings:

```
$ ansible-playbook localsystem.yml -K --tags=system_settings
```

**NOTE:** Here we use **-K** parameter so ansible asks for user password to run tasks with privileges.

## Creating new roles

If you want to group lots of tasks with a different purpose, I recommend you to create a dedicated playbook inside a role, you can create a role using the command ansible-galaxy, for example:

First, go inside your main directory on your proyect, we expect a roles directory on the root.

```
$ cd roles

$ ansible-galaxy init desktop-insync

$ tree desktop-insync/
desktop-insync/
├── defaults
│   └── main.yml
├── files
├── handlers
│   └── main.yml
├── meta
│   └── main.yml
├── README.md
├── tasks
│   └── main.yml
├── templates
├── tests
│   ├── inventory
│   └── test.yml
└── vars
    └── main.yml

8 directories, 8 files

```

Ansible galaxy will create the role files and directories structure, most of the work is on the tasks directory, inside the main.yml file.

```
$ vim roles/desktop-insync/tasks/main.yml
```

Before you can run the tasks on this new role, you have to incluide it on the main playbook, that is localsystem.yml, for example:

```
$ vim localsystem.yml
---

...
...
...

  roles:
    - common
    - desktop-insync

```
That is, if you want to clone this repository go ahead, please give feed back if you want to help to improve this.

