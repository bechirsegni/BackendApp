source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'devise'
gem 'devise_uid'
gem 'apartment'
gem 'awesome_nested_set'
gem 'chosen-rails'
gem "paranoia", "~> 2.2"

gem "paperclip", "~> 5.0.0"


group :development, :test do
  gem 'byebug', platform: :mri
  gem 'bcrypt', '~> 3.1', '>= 3.1.11'
  gem 'rubocop', '~> 0.47.1'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'better_errors', '~> 2.1', '>= 2.1.1'
end
