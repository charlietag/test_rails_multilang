# --------------------------------------------------------------------------------------
# Ref. https://guides.rubyonrails.org/i18n.html#configure-the-i18n-module
# Ref. https://yalantis.com/blog/multi-language-ruby-on-rails-app-development/
# Easier way to classify locale yml files
# --------------------------------------------------------------------------------------

# Where the I18n library should search for translation files

#I18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
I18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]

# Set default locale to something other than :en

I18n.default_locale = :en

# Whitelist locales available for the application

I18n.available_locales = [:en, :"zh-TW"]
