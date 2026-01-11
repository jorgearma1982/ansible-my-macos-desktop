vim
===

Tasks to setup vim on macOS.

Requirements
------------

MacOS based system.

Role Variables
--------------

These are default variables for this role:

- `dotfiles_repo`: repositorio git que contiene tus dotfiles (se clona en `~/.dotfiles`).
- `spell_languages`: lista de idiomas para descargar archivos de spell (por defecto `['en','es']`).
- `spell_base_url`: URL base para descargar los ficheros de spell de Vim.

Dependencies
------------

Example Playbook
----------------

To use this role, just include it in your playbook, for example:

    - hosts: desktop
      roles:
         - vim

License
-------

MIT

Author Information
------------------

Please any question, please contact the author at: <jorge.medina@kronops.com.mx>.
