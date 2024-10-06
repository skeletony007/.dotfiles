# .dotfiles

Using [GNU Stow] and [Ansible].

## Quickstart with Git Sparse Checkout

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
git sparse-checkout set role ...
```

The git-sparse-checkout command can be used to grow the working directory as
needed.

**Bespoke Bootstrap Script**

```
~/.dotfiles/bootstrap package ...
```

> [!TIP]
> Ignore tmux-quick-menu locally:
>
> ```
> git update-index --assume-unchanged tmux/.config/tmux/tmux-quick-menu
> ```
>
> Undo:
>
> ```
> git update-index --no-assume-unchanged tmux/.config/tmux/tmux-quick-menu
> ```

## Example: Install packages for a specific language

```
./install $(grep markdown packages-language)
```

Read the [docs](/docs/stow-packages.md#stow-packages).

[Ansible]: https://github.com/ansible/ansible
[GNU Stow]: https://www.gnu.org/software/stow/
