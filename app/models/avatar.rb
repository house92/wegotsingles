class Avatar < ApplicationRecord
  belongs_to :profile, required: false

  mount_uploader :avatar, AvatarUploader
end
