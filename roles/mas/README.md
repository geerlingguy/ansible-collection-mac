# Ansible Role: Mac App Store CLI (mas)

Installs [mas](https://github.com/mas-cli/mas) on macOS, and installs macOS apps from the Mac App Store.

## Requirements

  - **Homebrew**: Requires `homebrew` already installed (you can use `geerlingguy.mac.homebrew` to install it on your Mac).
  - **Mac App Store account**: You can either sign into the Mac App Store via the GUI before running this role, or you can set the `mas_email` and `mas_password` prior to running the role. For security reasons, if you're going to use this role to sign in, you should use `vars_prompt` for at least the password; don't store unencrypted passwords with your playbooks!

## Role Variables

Available variables are listed below, along with default values (see `defaults/main.yml`):

    mas_email: ""
    mas_password: ""

The credentials for your Mac App Store account. The Apps you install should already be purchased by/registered to this account.

If setting these variables statically (e.g. in an included vars file), you should encrypt the inventory using [Ansible Vault](http://docs.ansible.com/ansible/playbooks_vault.html). Otherwise you can use [`vars_prompt`](http://docs.ansible.com/ansible/playbooks_prompts.html) to prompt for the password at playbook runtime.

If you leave both blank, and don't prompt for them, the role assumes you've already signed in via other means (e.g. via GUI or `mas signin [email]`), and will not attempt to sign in again.

    mas_signin_dialog: false

Fallback to the built-in Mac App Store dialog to complete sign in. If set to yes, you must specify the aforementioned `mas_email` variable which will be autofilled in the dialog and prompt you to enter your password, followed by the 2FA authorization code if enabled on the account.

### Install apps

    mas_installed_apps:
      - { id: 425264550, name: "Blackmagic Disk Speed Test (3.0)" }
      - { id: 411643860, name: "DaisyDisk (4.3.2)" }
      - { id: 498486288, name: "Quick Resizer (1.9)" }
      - { id: 497799835, name: "Xcode (8.1)" }

A list of apps to ensure are installed on the computer using the Mac App Store. You can get IDs for all your existing installed apps with `mas list`, and you can search for IDs with `mas search [App Name]`. The `name` attribute is not authoritative and only used to provide better information in the playbook output.

    mas_upgrade_all_apps: false

Whether to run `mas upgrade`, which will upgrade all installed Mac App Store apps.

### Remove installed apps

    mas_uninstalled_apps:
      - { id: 408981434, name: "iMovie" }
      - { id: 409183694, name: "Keynote" }
      - { id: 409201541, name: "Pages" }
      - { id: 409203825, name: "Numbers" }
      - { id: 682658836, name: "GarageBand" }

A list of apps to uninstall from the computer, which were installed using the Mac App Store. You can get IDs for all your existing installed apps with `mas list`. The `name` attribute is not authoritative and only used to provide better information in the playbook output.

## Dependencies

  - (Soft dependency) `geerlingguy.homebrew`

## Example Playbook

    - hosts: localhost
      vars:
        mas_installed_apps:
          - { id: 497799835, name: "Xcode (8.1)" }
      roles:
        - geerlingguy.homebrew
        - geerlingguy.mas

See the [Mac Development Ansible Playbook](https://github.com/geerlingguy/mac-dev-playbook) for an example of this role's usage.

## License

MIT / BSD

## Author Information

This role was created in 2016 by [Jeff Geerling](https://www.jeffgeerling.com/), author of [Ansible for DevOps](https://www.ansiblefordevops.com/).
