# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', require: false
gem 'cssbundling-rails'
gem 'devise', '~> 4.9'
gem 'jbuilder'
gem 'jsbundling-rails'
gem 'omniauth-google-oauth2'
gem 'omniauth-rails_csrf_protection'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.6'
gem 'redis', '~> 4.0'
gem 'responders', '~> 3.1'
gem 'rubocop-capybara', '~> 2.18'
gem 'sidekiq'
gem 'simplecov', '~> 0.22.0'
gem 'slim-rails'
gem 'sprockets', '~> 4.0'
gem 'stimulus-rails'
gem 'tailwindcss-rails', '~> 2.0'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
end

group :development do
  gem 'rubocop', require: false
  gem 'rubocop-factory_bot'
  gem 'rubocop-i18n'
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', '~> 2.20', require: false
  gem 'rubocop-rake', require: false
  gem 'rubocop-rspec'
  gem 'ruby-lsp', require: false
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'rspec-rails', '~> 6.0.0'
end
