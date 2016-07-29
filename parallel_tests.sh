#!/bin/zsh

alias parallel_db_schema_load="bundle exec parallel_test --exec 'rake db:schema:load RAILS_ENV=test' -n 4"
alias parallel_spec="RAILS_ENV=test bundle exec parallel_test spec --type rspec -n 4 --suffix '_spec.rb|.feature'"
