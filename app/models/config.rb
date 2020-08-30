class Config < ApplicationRecord
  # Enums
  # Ref. https://guides.rubyonrails.org/active_record_querying.html#enums
  # Ref. https://api.rubyonrails.org/v6.0.3.2/classes/ActiveRecord/Enum.html
  # name -> locale
  # IN DB:
  #       record as 0 , or 1
  # IN Rails:
  #       Output as 'en', or 'zh-TW'
  # value -> 0:"en", 1:"zh-TW"
  enum config_value: [:en, :"zh-TW"]

  # This will insert nothing into DB, because column type of name , is var, not integer
  # enum can only be used in column type : integer
  # {"locale"=> 0}
  #enum name: [:locale]
end
