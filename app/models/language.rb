class Language < ApplicationRecord

  has_many :customer_languages, inverse_of: :language
  has_many :customers, through: :customer_languages

end
