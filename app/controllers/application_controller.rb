class ApplicationController < ActionController::Base

  around_action :switch_locale

  def switch_locale(&action)
    # ------------------------------------------------------
    # Set locale via routes (URI)
    # ------------------------------------------------------
    #locale = params[:locale] || I18n.default_locale
    #
    #I18n.with_locale(locale, &action)
    # ------------------------------------------------------

    # ------------------------------------------------------
    # Set locale via DB data
    # ------------------------------------------------------
    locale = Config.get_current_locale
    if locale.blank?
      locale = I18n.default_locale
    end

    I18n.with_locale(locale, &action)
    # ------------------------------------------------------


    # ------------------------------------------------------
    # Set locale The Accept-Language HTTP header
    # ------------------------------------------------------
    # logger.debug "* Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"
    # locale = extract_locale_from_accept_language_header
    # logger.debug "* Locale set to '#{locale}'"
    #
    # I18n.with_locale(locale, &action)
    # ------------------------------------------------------


  end

  # ------------------------------------------------------
  # Set locale via routes (URI)
  # ------------------------------------------------------
  # def default_url_options
  #   # --- Method 1 ---
  #   # Set locale again...
  #   #locale = params[:locale] || I18n.default_locale
  #   #{ locale: locale }

  #   # --- Method 2 (recommended) ---
  #   # Do not set locale again...
  #   # switch_locale should've already change the locale
  #   # https://guides.rubyonrails.org/i18n.html#setting-the-locale-from-url-params
  #   { locale: I18n.locale }
  # end
  # ------------------------------------------------------

  # ------------------------------------------------------
  # Set locale The Accept-Language HTTP header
  # ------------------------------------------------------
  # Ref. https://guides.rubyonrails.org/i18n.html#choosing-an-implied-locale
  # Ref. https://yalantis.com/blog/multi-language-ruby-on-rails-app-development/

  # private
  # def extract_locale_from_accept_language_header
  #   req_http_lang = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first

  #   locale = I18n.default_locale
  #   if req_http_lang =~ /^zh/
  #     locale = 'zh-TW'
  #   end
  # end
  # ------------------------------------------------------

end
