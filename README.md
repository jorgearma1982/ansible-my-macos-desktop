# Ansible for my work macos desktop

## Introduction

I love GNU/Linux and I miss it every time I have to use MacOS for work tasks, so I wrote this guide to have
a repeatable procedure to setup my developer workspace using most of the GNU and Open Source programs I love
on MacOS.

We are automating the post-setup process which is all the tasks we run after installing MacOS from scratch.

### Objectives

Automatically execute the tasks in the post-setup process, personally I run this tasks
every time after installing the operating system. We are going to use ansible to deploy:

* Installation of Homebrew packages for:
  * Browser
  * GNU Command Line
  * File management
  * Video
  * Terminal
  * Advanced Search
  * System Monitoring
  * Database clients
  * Development
  * Networking
  * Cloud
  * DevOps

## Requirements

We are going to run all this procedures from the command line, so *bash* is required, we also need a stable
Internet connection to download all packages.

## Cloning the repository

First we need to our working directory, and clone the repository from github, for example:

```shell
mkdir ~/data/vcs
cd ~/data/vcs
git clone https://github.com/jorgearma1982/ansible-my-macos-desktop
cd ansible-my-macos-desktop
```

## Installing and Testing Ansible

In order to install ansible, you need to run **bin/setup.sh**, for example:

```shell
bin/setup.sh
```

This scripts tests localhost connection at the end.

## Validating local connection

Now run ansible with local connection to localhost.

```shell
ansible 127.0.0.1 -c local -m ping
```

Go to next section to run playbooks.

## The playbook

The main playbook is **localsystem.yml**, let's display it:

```shell
$ cat localsystem.yml
---
- hosts: localhost
  connection: local
  user: macos
  become: yes
  roles:
    - common
```

## Running the Ansible playbook

Before you run ansible, please edit localsystem.yml playbook file, change the variable **user** with your own
username, for example:

```shell
sed -i 's/macos/$USER/' localsystem.yml
```

So, it looks like this:

```yaml
- hosts: localhost
  connection: local
  user: jmedina
  become: yes
```

As you could see in the playbook header, we connect to localhost with the local user jmedina and use sudo to
gain privileges.
