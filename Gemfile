source 'http://rubygems.org'

# Alphabetize

gem 'haml'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.0.rc2'
gem 'sass-rails', '~> 5.0'
gem 'jquery-rails'
gem 'uglifier'
gem 'httmultiparty', '~> 0.3.16'

group :development, :test do
  gem 'rspec-rails', '~> 3.5.2'
  gem 'better_errors'
  gem 'capybara', '~> 2.13.0'
  gem 'pry', platforms: [:mri, :mingw, :x64_mingw]
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '~> 3.1.2', git: 'https://github.com/thoughtbot/shoulda-matchers.git',
    branch: 'rails-5'
  gem 'rubocop'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

ruby '2.4.1'
