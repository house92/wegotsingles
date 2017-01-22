class CustomerLanguage < ApplicationRecord

  belongs_to :customer
  belongs_to :language

end
