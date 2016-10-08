class Character < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  validate :have_active_character?
  validates_presence_of :name,:image,:gender,:user
  validates_uniqueness_of :name, :message => "This name is already being used"

  def have_active_character?
    !self.user.active_character
    errors.add(:base, "You already have an active character")
  end
end
