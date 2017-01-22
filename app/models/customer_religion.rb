class CustomerReligion < ApplicationRecord

  belongs_to :customer
  belongs_to :religion

end
