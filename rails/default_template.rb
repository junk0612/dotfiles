gem_group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

remove_dir 'test'

after_bundle do
  generate 'rspec:install'
  git add: '.'
  git commit: '-am "Initialize repository"'

  if yes?('Add remote repository?')
    git remote: "add origin #{ask('Input remote repository:')}"
    git push: 'origin master' if yes?('Push to remote repository?')
  end
end
