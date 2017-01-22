class Ethnicity < ApplicationRecord

  has_many :customer_ethnicities, inverse_of: :ethnicity
  has_many :customers, through: :customer_ethnicities

end
