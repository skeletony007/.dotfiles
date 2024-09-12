# .dotfiles

Using [GNU Stow] and [Ansible].

## Quick Start with Git Sparse Checkout

**GNU Stow dotfiles**

```
git clone --depth=1 --single-branch --sparse https://github.com/skeletony007/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
git sparse-checkout set package ...
```

**Ansible Roles**

```
git clone --depth=1 --single-branch --sparse https://github.com/skeletony007/ansible-roles.git ~/personal/ansible-roles
cd ~/personal/ansible-roles
git sparse-checkout set package ...
```

The git-sparse-checkout command can be used to grow the working directory as
needed.

**Bespoke Bootstrap Script**

```
~/.dotfiles/bootstrap package ...
```

## Example: Install packages for a specific language

```
./install $(grep markdown packages-language)
```

[Ansible]: https://github.com/ansible/ansible
[GNU Stow]: https://www.gnu.org/software/stow/
