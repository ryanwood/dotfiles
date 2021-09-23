abbr g         'git'

abbr ga        'git add'
abbr gaa       'git add --all'
abbr gau       'git add --update'

abbr gbl       'git blame'

abbr gb        'git branch -vv'
abbr gbx       'git branch -d'
abbr gbX       'git branch -D'

abbr gco       'git checkout'
abbr gcb       'git checkout -b'

abbr gcp       'git cherry-pick'
abbr gcpa      'git cherry-pick --abort'
abbr gcpc      'git cherry-pick --continue'

abbr gcln      'git clean -fd'

abbr gcl       'git clone --recursive'

abbr gc        'git commit -v'
abbr gc!       'git commit -v --amend'
abbr gca       'git commit -v -a'
abbr gca!      'git commit -v -a --amend'
abbr gcam      'git commit -a -m'
abbr gcmsg     'git commit -m'
abbr gcan!     'git commit -v -a --no-edit --amend'
abbr gcans!    'git commit -v -a -s --no-edit --amend'
abbr gcn!      'git commit -v --no-edit --amend'
abbr gcs       'git commit -S'
abbr gcsm      'git commit -s -m'

abbr gcf       'git config --list'

abbr gdct      'git describe --tags `git rev-list --tags --max-count=1`'

abbr d         'git diff'
abbr gd        'git diff'
abbr gdca      'git diff --cached'
abbr gdt       'git diff-tree --no-commit-id --name-only -r'
abbr gdw       'git diff --word-diff'

abbr gf        'git fetch'
abbr gfa       'git fetch --all --prune'
abbr gfo       'git fetch origin --prune'
abbr gfix      'git diff --name-only | uniq | xargs $EDITOR'

abbr gm        'git merge --no-ff'
abbr gmf       'git merge --ff-only'

abbr gp        'git push'
abbr gpf       'git push --force-with-lease'
abbr gpristine 'git reset --hard && git clean -dfx'
abbr gpu       'git push -u'

abbr grb       'git rebase'
abbr grba      'git rebase --abort'
abbr grbc      'git rebase --continue'
abbr grbi      'git rebase -i'
abbr grbm      'git rebase master'
abbr grbs      'git rebase --skip'

abbr gr        'git reset'
abbr grh       'git reset --hard'
abbr grhc      'git reset --hard && git clean -fd'
abbr grs       'git reset --soft'

# gem install git-smart
abbr gup       'git smart-pull'

abbr gst       'git stash'
abbr gsta      'git stash apply'
abbr gstc      'git stash clear'
abbr gstd      'git stash drop'
abbr gstl      'git stash list'
abbr gsts      'git stash save'
abbr gstst     'git stash show --text'
abbr gstp      'git stash pop'
abbr gstu      'git stash -u'

abbr s         'git status -sb'
abbr gs        'git status -sb'

abbr gsi       'git submodule init'
abbr gsu       'git submodule update'

abbr gunignore 'git update-index --no-assume-unchanged'

abbr gwch      'git whatchanged -p --abbrev-commit --pretty=medium'
