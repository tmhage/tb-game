class Character < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates_presence_of :name,:image,:gender,:user
  validates_uniqueness_of :name, :message => "This name is already being used"
end
