source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.6'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]


group :development do
    # gem "rspec-rails"
    gem "guard-rspec"
    # gem 'pry'
    # gem 'pry-rails'
    # gem 'pry-doc'
    gem 'pry-stack_explorer'
    gem 'pry-nav'

    if RUBY_VERSION >= '2.0.0'
        #gem 'pry-byebug'
    else
        # 以下はRuby1.9の時のみ使う(pry-byebugの代わりに)
        # debuggerは1.9以下でしか動作しない, remote は byebug で使えないようになった
        gem 'pry-debugger'
        gem 'pry-remote'
    end

    #fast command
    gem "spring"

    gem 'rails-erd'
    gem 'quiet_assets'
    gem 'guard-livereload', require: false
    gem "faker"
    # profile
    gem 'rack-mini-profiler'
    gem 'hirb'
end
gem 'pg', '~> 0.17.1'
gem "awesome_print", require: "ap"
gem 'activerecord-postgis-adapter'
gem "geocoder"

