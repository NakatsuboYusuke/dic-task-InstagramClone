source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
# Ruby
ruby '2.6.3'

# Core
gem 'rails', '~> 5.2.3'

# Middleware
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.3'

# View/Font
gem 'sass-rails', '~> 5.0'
gem 'autoprefixer-rails'
gem 'jquery-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'slim-rails'
gem 'html2slim'
gem 'font-awesome-rails'
gem 'gon'

# Debug
gem 'pry-rails'
gem 'better_errors'
gem 'binding_of_caller'
gem 'faker'

# Backend
gem 'jbuilder', '~> 2.5'
# jsのレンダリングのために、アップ時はturbolinksを下げる
#gem 'turbolinks', '~> 5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'rails-i18n'
gem 'bcrypt', '3.1.11'
gem 'carrierwave', '~> 2.0'
gem 'mini_magick'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener_web'
  #ENVでSecurity対策
  gem 'dotenv-rails'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
