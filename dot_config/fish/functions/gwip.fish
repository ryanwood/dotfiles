# Work In Progress (wip)
# These features allow to pause a branch development and switch to another one
# When you want to go back to work, just unwip it
function gwip -d 'git commit a work-in-progress branch'
  git add -A
  git rm (git ls-files --deleted) 2> /dev/null
  git commit --no-verify --no-gpg-sign -m '--wip-- [skip ci]'
end
