class Religion < ApplicationRecord

  has_many :customer_religions, inverse_of: :religion
  has_many :customers, through: :customer_religions

end
