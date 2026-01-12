vscode
======

Tasks to setup vscode on macOS.

Requirements
------------

MacOS based system.

Role Variables
--------------

These are default variables for this role:

- `vscode_extensions` (list): list of extension identifiers to install.
- `dotfiles_repo`: git repo containing dotfiles.

Dependencies
------------

Example Playbook
----------------

To use this role, just include it in your playbook, for example:

    - hosts: desktop
      roles:
         - vscode

License
-------

MIT

Author Information
------------------

Please any question, please contact the author at: <jorge.medina@kronops.com.mx>.
