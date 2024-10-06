# Issues and Pull Requests

Have an issue? Write it down and slide it under your pillow, tonight the Git
fairy will find your home and take it away when you're not looking.

Alternatively add a new issue at <https://github.com/skeletony007/.dotfiles/issues/new>.

> [!WARNING]
> skeletony007 has the final opinion; any conflicts may be rejected or closed
> without reason.

I appreciate each contribution. Isn't there that other thing you need to do?

# Conventional Commits

The commit message should be structured as follows:

```gitcommit
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

In general, scope will be some [package(s)](/docs/stow-packages.md#stow-packages).

**FAQ: Do all my contributors need to use the Conventional Commits specification?**

No! If you use a squash based workflow on Git lead maintainers can clean up the
commit messages as they’re merged - casual committers shouldn't let it get in
the way.

\- [Conventional Commits Spec]

[Conventional Commits Spec]: https://www.conventionalcommits.org/en/v1.0.0/#specification

# Branches

Branches should be named as follows:

```
<type>/<scope>
```

Again, scope will generally be some [package(s)](/docs/stow-packages.md#stow-packages).

**Do whatever is easiest at the time. Feel free to push straight to master.**
