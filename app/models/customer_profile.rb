class CustomerProfile < ApplicationRecord
  self.primary_key = 'id'
  has_many :customer_ethnicities, foreign_key: :customer_id
  has_many :ethnicities, through: :customer_ethnicities
end