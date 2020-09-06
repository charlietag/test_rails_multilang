# README
* Try rails multiple Language - built in function

## Packages

* Ruby version
  * 2.7.0

* Rails version
  * 6.0.3.2

## Basic setup
* Gems - useful for dev
  * gem 'pry-rails', :group => :development
  * gem 'bullet', group: 'development'

* Package - usefule for html form generation
  * `gem 'simple_form'`
  * `rails generate simple_form:install --bootstrap`

* jQuery
  * yarn add jquery
    * {project_name}/app/javascript/packs/application.js

      ```bash
      import "jquery/src/jquery"
      ...
      ```

* bootstrap
  * yarn add bootstrap popper.js (don't add popper v2, bootstrap default requires v1.16) , (no need to import popper.js manually, bootstrap will do it automatically)
    * app/javascript/packs/application.js
      * `import "bootstrap/dist/js/bootstrap"`
    * app/assets/stylesheets/application.css
      * `*= require 'bootstrap/dist/css/bootstrap'`

## Rails setup

* generate scaffold
  * `bin/rails g scaffold Book name:string author:string`
  * `bin/rails g scaffold Config name:string value:string`


## config - credential

* command
  * `EDITOR=vim bundle exec rails credentials:edit`

    ```bash
    development:
      db:
        user: user
        pass: pass

    production:
      db:
        user: user
        pass: pass
    ```

* config/database.yml

  ```bash
  default: &default
    adapter: mysql2
    encoding: utf8mb4
    pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
    username: <%= Rails.application.credentials[Rails.env.to_sym][:db][:user] %>
    password: <%= Rails.application.credentials[Rails.env.to_sym][:db][:pass] %>
    socket: /var/lib/mysql/mysql.sock

  development:
    <<: *default
    database: {project_name}_development

  test:
    <<: *default
    database: {project_name}_test

  production:
    <<: *default
    database: {project_name}_production
  ```

* Create database
  * `bundle exec rails db:create`

## Changes
* https://github.com/charlietag/test_rails_multilang/compare/v0.0.0...v0.0.1
  * Basic config and setup
    * `gem 'simple_form'`

* https://github.com/charlietag/test_rails_multilang/compare/v0.0.1...v0.0.2
  * Start trying Multi-Language for layout (change locale by URI - rails routes)
    * Rails scaffold
    * `gem 'rails-i18n', '~> 6.0.0'`
  * i18n built in methods
    * [RailsGuide-i18n#overview-of-other-built-in-methods-that-provide-i18n-support](https://guides.rubyonrails.org/i18n.html#overview-of-other-built-in-methods-that-provide-i18n-support)
    * [RailsGuide-i18n#method-i-distance_of_time_in_words_to_now](https://api.rubyonrails.org/classes/ActionView/Helpers/DateHelper.html#method-i-distance_of_time_in_words_to_now)
    * [ihoweri#actionview-helpers (Chinese)](https://ihower.tw/rails/actionview-helpers.html)

* https://github.com/charlietag/test_rails_multilang/compare/v0.0.2...v0.0.3
  * Start trying Multi-Language for layout
    * **change locale by -**
      * Config setting in DB - Config.where(name: "locale").first.value
        * Enum
          * Map integer to string value, so **change column type to integer**
          * **DO NOT USE value as column name**, because enum will create related method using method name value
            * https://api.rubyonrails.org/v6.0.3.2/classes/ActiveRecord/Enum.html
        * Enum ref:
          * [RailsGuide#enums](https://guides.rubyonrails.org/active_record_querying.html#enums)
            * **The enum macro maps an integer column to a set of possible values.**
          * [RailsAPI#Enum](https://api.rubyonrails.org/v6.0.3.2/classes/ActiveRecord/Enum.html)
          * Change column type from var to integer
            * `rails g migration ChangeColumnValueToConfigValue`
            * `rails g migration ChangeConfigValueTypeToInteger`
            * `rails db:migrate VERSION=20200829082752`
            * `rails db:migrate`
        * Tried `app/{models,controllers}/concerns/*.rb`
          * Not recommended to use ([link][https://medium.com/@carlescliment/about-rails-concerns-a6b2f1776d7d])
          * Use before_action inside Controller instead
          * Use Service Object over **concerns**
* https://github.com/charlietag/test_rails_multilang/compare/v0.0.3...v0.0.4
  * set locale by detecting **The Accept-Language HTTP header**
  * Set locale **through DB data**

* https://github.com/charlietag/test_rails_multilang/compare/v0.0.4...v0.0.5
  * Start trying GEM: **globalize**


## Note
* Package - Multi-language content
  * `gem 'globalize', '>= 6.0.0.alpha.1'`
  * `config.i18n.fallbacks = true`
    * This is already been set in `{RailsApp}/config/environments/production.rb`
    * This is used , when choosed locale is not found.
* Leak issue
  * https://guides.rubyonrails.org/i18n.html#managing-the-locale-across-requests
    * Dos
      * `I18n.with_locale`
    * Don'ts
      * `I18n.locale =`


* References
  * Layout Multi-language
    * Ref. https://guides.rubyonrails.org/i18n.html
    * Ref. https://github.com/svenfuchs/rails-i18n/blob/master/rails/locale/zh-TW.yml
    * Ref. https://yalantis.com/blog/multi-language-ruby-on-rails-app-development/
  * Content Multi-Language
    * Ref. https://github.com/globalize/globalize/tree/v6.0.0.alpha.1
  * It's About Time (Zones)
    * https://thoughtbot.com/blog/its-about-time-zones
