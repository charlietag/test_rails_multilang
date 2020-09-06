Rails.application.routes.draw do
  # --------------------------------------------------------------------------------------------------------------
  # Set locale via routes (URI)
  # --------------------------------------------------------------------------------------------------------------
  #scope "(:locale)", locale: /en|"zh-TW"/ do #<--- [err] rails route doesn't allow ""
  #scope "/:locale" do                        #<--- Allow all locale

  # default redirect to /:locale/books , such as /en/books
  # scope "(:locale)", locale: /en|zh-TW/ do    #<--- Allow only specific language
  #   resources :configs
  #   resources :books
  # end
  # --------------------------------------------------------------------------------------------------------------

  # --------------------------------------------------------------------------------------------------------------
  # Set locale via DB or Accept-Language HTTP header
  # --------------------------------------------------------------------------------------------------------------
  resources :configs
  resources :books

end
