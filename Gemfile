source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.0'
gem 'rails', '~> 6.0.4', '>= 6.0.4.4'

gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bcrypt', '~> 3.1.7'
gem 'psych', '~> 3.1'
gem 'rexml'
gem "net-smtp"
gem 'net-pop', require: false
gem 'net-imap', require: false
gem 'faker'
gem "carrierwave"
gem "mini_magick"
gem 'mimemagic', '0.3.7'
gem 'font_awesome5_rails'
gem 'omniauth-facebook'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'letter_opener_web'
gem 'fog-aws'
gem 'dotenv-rails'
gem 'unicorn'

group :development, :test do
 gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
 gem "pry-byebug"
 gem "better_errors"
 gem "binding_of_caller"
 gem 'capistrano', '3.16.0' # capistranoのツール一式
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano3-unicorn'
  gem 'ed25519'
  gem 'bcrypt_pbkdf'
end

group :development do
 
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
