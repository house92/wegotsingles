class Profile < ApplicationRecord

  belongs_to :customer

  belongs_to :default_avatar, class_name: "Avatar", required: false

  has_many :avatars
  accepts_nested_attributes_for :avatars

  before_save :set_default_avatar

  private

  def set_default_avatar
    if self.avatars.count == 1
      self.default_avatar = self.avatars.first
    end
  end

  def self.list_genders
    ["Male", "Female"]
  end

  def self.list_smokers
    ['Smoker', 'Non-Smoker', 'Social Smoker']
  end  

end
