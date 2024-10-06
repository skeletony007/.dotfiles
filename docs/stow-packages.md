# Stow Packages

skeletony007's .dotfiles are organized into **package groups**, each
representing related packages that are often installed together.

**Top-level package groups** are seperate files with the `packages-` prefix
found in the top level of the **GIT_DIR** and are installed with
`./install $(< packages-[group name])`.

**Low-level package groups** are lines in `packages-` files and are installed
with `./install $(grep package packages-[group name])`.

**Individual packages** are installed with `./install package ...`

# Naming Stow Packages

Use kebab-case alphabetic characters, prefering lower-case where possible.

An example exception is `Archlinux`, which is a reference Ansible Facts.
