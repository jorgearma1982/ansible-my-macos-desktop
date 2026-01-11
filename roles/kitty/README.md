kitty
=====

Tasks to install and configure the kitty terminal on macOS.

Requirements
------------

MacOS based system.

Role Variables
--------------

These are default variables for this role:

Role Variables (defaults in `defaults/main.yml`)

- `dotfiles_repo` - Git repository URL for your dotfiles (default: `https://github.com/jorgearma1982/dotfiles.git`).
- `dotfiles_dest` - Destination path for the cloned dotfiles (default: `~/.dotfiles`).
- `kitty_config_dir` - Kitty configuration directory (default: `~/.config/kitty`).
- `kitty_themes_repo` - Repository with kitty themes (default: `https://github.com/dexpota/kitty-themes.git`).
- `kitty_themes_dest` - Where the themes repo will be cloned (default: `{{ kitty_config_dir }}/kitty-themes`).
- `kitty_theme_source` - Path inside the themes repo to the Dracula theme (default: `themes/Dracula.conf`).
- `kitty_theme_link` - Symlink path for the active theme (default: `{{ kitty_config_dir }}/theme.conf`).

Dependencies
------------

Example Playbook
----------------

To use this role, just include it in your playbook, for example:

    - hosts: desktop
      roles:
         - common
         - kitty

License
-------

MIT

Author Information
------------------

Please any question, please contact the author at: <jorge.medina@kronops.com.mx>.
