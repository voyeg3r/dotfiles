
### Comandos git

### update local repo with github updates

    git pull origin master

### Shallow clone

    ``` sh
    git clone --depth 1 https://github.com/voyeg3r/dotfiles
    ```

### como ver o que mudou em um arquivo

    git log --follow -p --  bin/get-1000-phrases.sh

### acessar uma linha específica de um arquivo do github

    ``` sh
    https://github.com/atomaka/dotfiles/blob/master/Makefile#L10
    ```

    Como visto acima basta colocar no final da url #Ln  "onde n é
    o número da linha"

### Submódulos

    git submodule add --force https://github.com/zsh-users/zsh-autosuggestions.git

    # after some changes at master
    git pull


Or, if you're a busy person:

    git submodule foreach git pull origin master

### Clonando um repo e também os submódulos

    git clone --recursive repo
    git fetch --recurse-submodules --jobs=4

### Reverting to an specifi commit
+ https://stackoverflow.com/questions/4114095/

    git log, I get the following output:

    $ git log
    commit a867b4af366350be2e7c21b8de9cc6504678a61b`
    Author: Me <me@me.com>
    Date:   Thu Nov 4 18:59:41 2010 -0400

    blah blah blah...

    commit 25eee4caef46ae64aa08e8ab3f988bc917ee1ce4
    Author: Me <me@me.com>
    Date:   Thu Nov 4 05:13:39 2010 -0400

Then you can navigate on the log using vim like keys
j, k and make search with /pattern<enter> to figure out
what will be the check point.

So let's say you get this:

This will detach your HEAD, that is, leave you with no branch checked out:

        git checkout 0d1d7fc32

Or if you want to make commits while you're there, go ahead and make a new
branch while you're at it:  (this will create a new branch)

    git checkout -b old-state 0d1d7fc32

**Hard delete unpublished commits**

If, on the other hand, you want to really get rid of everything you've done
since then, there are two possibilities. One, if you haven't published any of
these commits, simply reset:

    # This will destroy any local modifications.
    # Don't do it if you have uncommitted work you want to keep.
    git reset --hard 0d1d7fc32

** Alternatively, if there's work to keep:**

    git stash
    git reset --hard 0d1d7fc32
    git stash pop
    # This saves the modifications, then reapplies that patch after resetting.
    # You could get merge conflicts, if you've modified things which were
    # changed since the commit you reset to.

If you mess up, you've already thrown away your local changes, but you can at
least get back to where you were before by resetting again.  Undo published
commits with new commits

On the other hand, if you've published the work, you probably don't want to reset the branch, since that's effectively rewriting history. In that case, you could indeed revert the commits. With Git, revert has a very specific meaning: create a commit with the reverse patch to cancel it out. This way you don't rewrite any history.

# This will create three separate revert commits:
git revert a867b4af 25eee4ca 0766c053

# It also takes ranges. This will revert the last two commits:
git revert HEAD~2..HEAD

#Similarly, you can revert a range of commits using commit hashes:
git revert a867b4af..0766c053

# Reverting a merge commit
git revert -m 1 <merge_commit_sha>

# To get just one, you could use `rebase -i` to squash them afterwards
# Or, you could do it manually (be sure to do this at top level of the repo)
# get your index and work tree into the desired state, without changing HEAD:
git checkout 0d1d7fc32 .

# Then commit. Be sure and write a good message describing what you just did
git commit

The git-revert manpage actually covers a lot of this in its description. Another useful link is this git-scm.com blog post discussing git-revert.

If you decide you didn't want to revert after all, you can revert the revert (as described here) or reset back to before the revert (see the previous section).

You may also find this answer helpful in this case:
How to move HEAD back to a previous location? (Detached head)


### Reverter para um comit específico clonando o mesmo
+ https://stackoverflow.com/a/14091182/2571881

    git clone $URL
    cd $PROJECT_NAME
    git reset --hard $SHA1

To again go back to the most recent commit

    git pull

### Pegar um arquivo de um determinado commit
+ https://stackoverflow.com/a/610216/2571881

English Title: How to retrieve a single file from specific revision in Git?

If you are without Internet you can use `git log` to find out
which revision you want to retrive


    git show a873e510a2c1c5618f32426e3623ade8e63e75f0:rcfiles/zsh/zshrc > ~/zsh-backup

    git show a873e510a2c1c5618f32426e3623ade8e63e75f0:rcfiles/zsh/zshrc | vim -



