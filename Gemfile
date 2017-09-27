source 'http://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Alphabetize

gem 'haml'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.0.rc2'
gem 'sass-rails', '~> 5.0'
gem 'materialize-sass'
gem 'jquery-rails'
gem 'rubocop'
gem 'uglifier'

group :development, :test do
  gem 'better_errors'
  gem 'capybara', '~> 2.13.0'
  gem 'pry', platforms: [:mri, :mingw, :x64_mingw]
  gem 'selenium-webdriver'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

ruby '2.4.1'
