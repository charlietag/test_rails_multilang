class Book < ApplicationRecord
  validates :name, presence: true

  extend Mobility
  translates :name, type: :string
  translates :author, type: :string
  translates :description, type: :text
end
