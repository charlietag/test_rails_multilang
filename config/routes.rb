Rails.application.routes.draw do
  #scope "(:locale)", locale: /en|"zh-TW"/ do #<--- [err] rails route doesn't allow ""
  #scope "/:locale" do                        #<--- Allow all locale
  scope "(:locale)", locale: /en|zh-TW/ do    #<--- Allow only specific language
    resources :configs
    resources :books
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
