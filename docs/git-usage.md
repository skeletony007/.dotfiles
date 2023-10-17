## Using Git

**This document assumes you are using GitHub** (URLs are for GitHub)

🔑 Key
| Placeholder | Value |
|--|--|
| `USERNAME` | GitHub Login |
| `REPO` | The name of the GitHub repository that you want to work on |

### Clone a Git repository

- **Cone** a Git repository to the working directory
   ```bash
   $ git clone https://github.com/USERNAME/REPO.git
   ```

## Using Git step-by-step ⚙️

1. **Stage** the changes ready for a commit

   Use the `git add` command to stage a directory

   ```bash
   $ git add /path/to/REPO
   ```

   - you can use the `.` argument instead of a directory if the current
     directory is the one you want to commit

2. **Commit** changes to your local Git repository

   Use the `git commit` command to commit the staged changes with a commit
   message

   ```bash
   $ git commit -m <commit message>
   ```

3. **Push** your changes to a remote Git repository\*

   Use the `git remote` command to add the URL of the remote GitHub repository
   as a remote

   ```bash
   $ git remote add origin https://github.com/USERNAME/REPO.git
   ```

   - If you get the error message `error: remote origin already exists` when
     trying to add a remote to your Git repository, it means that a remote named
     "origin" has already been added to your repository. Execute

     ```bash
     $ git remote set-url origin https://github.com/USERNAME/REPO.git
     ```

     to fix this.

   - Note that you only need to do this if `origin` is not already
     https://github.com/USERNAME/REPO.git

     You can display the URL of the remote Git repository that is currently set
     as `origin`

     ```bash
     $ git remote get-url origin
     ```

   Use the `git push` command to upload commits to the remote Git repository.

   ```bash
   $ git push -u origin main
   ```

   - If you see something like `Resolving deltas: 100%`, then you have
     successfully pushed your changes.

   \* This step is not always necessary, but I have included it for
      completeness.

If you want to push more changes, you can execute

```bash
$ git add . ; git commit -m <commit message> ; git push --force
```

from `/path/to/REPO`

- Note that force pushing can overwrite changes on the remote repository, so it
  should be used with caution

### Git submdule

Here, `REPO` is the name of the repository you want to add as a submodule. I.e.
`/path/to/REPO` is a subdirectory of the current repository that is not yet 
created.

```bash
git submodule add https://github.com/USERNAME/REPO.git /path/to/REPO
```

To update the contents of the Git submodule, execute

```bash
git pull
```

from the submodule directory.

### Undo things 📜

> [How to undo (almost) anything with Git](https://github.blog/2015-06-08-how-to-undo-almost-anything-with-git/) (See https://stackoverflow.com/q/15772134)
>
> [Learn how to rewrite Git history](https://youtu.be/ElRzTuYln0M) (unofficial)

#### Interactive rebase

To use Reword, Delete, Reorder\*, Squash and Split:

```bash
git rebase -i HEAD~n  ## replace `n` with the number of commits to show (from the latest)
```

**Note** that interactive rebase shows commits in reverse chronological order.

\* To reorder, literally change the line order in the file

#### The latest commit

To add untracked files to the last commit:

```bash
git add <untracked files>
git commit --amend --no-edit
```

To change the commit message, just replace `--no-edit` with `-m <message text>`

#### Accidental severe repository damage

Execute

```bash
git reflog
```

to find the desired branch state commit code (e.g. c9ff7ca).

Then execute

```bash
git reset --hard <commit code>
```

Use `git push -f`.

#### Why is `push -f` necessary?

`git push -f` can be used to overwrite history at the remote branch.

## Removing a local clone of a repository

When you're done with a repository and don't want it taking up space, here's
what to do.

Execute

```bash
$ cd /workspaces ; rm -rf /workspaces/REPO ; rm -f /workspaces/ID/REPO
```

`-r` "recursive"

`-f` "force" (suppress confirmation messages)

