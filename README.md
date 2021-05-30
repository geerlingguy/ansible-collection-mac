# Jeff Geerling's Mac Collection for Ansible

[![CI][badge-gh-actions]][link-gh-actions]

TODO: Docs go here.

Roles included in this collection (click on the link to see the role's README and documentation):

  - [`geerlingguy.mac.homebrew`](roles/homebrew)
  - [`geerlingguy.mac.mas`](roles/mas)
  - `geerlingguy.mac.dock` (to be added soon!)

## Installation

Install via Ansible Galaxy:

```
ansible-galaxy collection install geerlingguy.mac
```

Or include this collection in your playbook's `requirements.yml` file:

```
---
collections:
  - name: geerlingguy.mac
```

For a real-world example, see my [Mac Dev Playbook's requirements file](https://github.com/geerlingguy/mac-dev-playbook/blob/master/requirements.yml).

### Role Requirements

Requires separate installation of the `elliotweiser.osx-command-line-tools` role. Because Ansible collections are not able to depend on roles, you will need to make sure that role is installed either by manually installing it with the `ansible-galaxy` command, or adding it under the `roles` section of your `requirements.yml` file:

```yaml
---
roles:
  - name: elliotweiser.osx-command-line-tools

collections:
  - name: geerlingguy.mac
```

## Usage

TODO.

For a real-world usage example, see my [Mac Dev Playbook](https://github.com/geerlingguy/mac-dev-playbook).

## License

MIT

## Author

This collection was created by [Jeff Geerling](https://www.jeffgeerling.com), author of [Ansible for DevOps](https://www.ansiblefordevops.com).

[badge-gh-actions]: https://github.com/geerlingguy/ansible-collection-mac/workflows/CI/badge.svg?event=push
[link-gh-actions]: https://github.com/geerlingguy/ansible-collection-mac/actions?query=workflow%3ACI
