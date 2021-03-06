abbr b       'bundle'
abbr bx      'bundle exec'

abbr d       'git diff'
abbr devlog  'tail -f log/development.log'
abbr ds      'NO_CONFIRM=1 ./deploy staging'
abbr dp      './deploy --preboot production'

abbr hlp     'heroku logs -r production'
abbr hls     'heroku logs -r staging'
abbr hltp    'heroku logs -t -r production'
abbr hlts    'heroku logs -t -r staging'
abbr hrcp    'heroku run console -r production'
abbr hrcs    'heroku run console -r staging'

abbr prodlog 'tail -f log/production.log'
abbr pt      'papertrail'

abbr rc      'rails console'
abbr rcs     'rails console --sandbox'
abbr rd      'rails destroy'
abbr rdb     'rails dbconsole'
abbr rdm     'rails db:migrate'
abbr rdms    'rails db:migrate:status'
abbr rdmtc   'rails db:migrate db:test:clone'
abbr rdr     'rails db:rollback'
abbr rdtc    'rails db:test:clone'
abbr rdsl    'rails db:schema:load'
abbr rdtp    'rails db:test:prepare'
# Can't use rg due to ripgrep
abbr rj      'rails generate'
abbr rjm     'rails generate migration'
abbr rs      'rails server'
abbr rsd     'rails server --debugger'
abbr rsp     'rails server --port'
abbr rst     'touch tmp/restart.txt'
abbr rlc     'rails log:clear'
abbr rr      'rails routes'
abbr rrg     'rails routes | grep'
abbr rsts    'rails stats'

abbr t       'rspec'
abbr testlog 'tail -f log/test.log'
abbr tff     'rspec --fail-fast'
abbr tfo     'rspec --only-failures'
abbr trc     'rubocop'
abbr tsl     'slim-lint app/**/*.slim'
abbr twos    'rspec --exclude-pattern spec/system/**/*_spec.rb'
abbr twoj    'rspec --tags ~js spec/'

abbr ta      'tmux attach -t'
abbr tad     'tmux attach -d -t'
abbr ts      'tmux new-session -s'
abbr tl	     'tmux list-sessions'
abbr tksv    'tmux kill-server'
abbr tkss    'tmux kill-session -t'

abbr n       'nvim'
abbr v       'nvim'
abbr vi      'nvim'
abbr vim     'nvim'
abbr vimdiff 'nvim -d'

abbr y       'yarn'
abbr ys      'yarn spec'
abbr ysw     'yarn spec --watch'
abbr yui     'yarn upgrade-interactive --latest'
