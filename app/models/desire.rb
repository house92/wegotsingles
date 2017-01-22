class Desire < ApplicationRecord

  has_many :customer_desires, inverse_of: :desire
  has_many :customers, through: :customer_desires

end
