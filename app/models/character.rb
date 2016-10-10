class Character < ApplicationRecord
  scope :online, -> { where(:online => true) }
  belongs_to :user
  mount_uploader :image, ImageUploader
  validate :have_active_character?, :lenghty
  validates_presence_of :name,:image,:gender,:user
  validates_uniqueness_of :name, :message => "This name is already being used"

  RANKS = {
    1 => "Soldier",
    2 => "Sergeant",
    3 => "General"
  }

  def rankname
    RANKS[self.rank]
  end

  def have_active_character?
    !self.user.active_character
    errors.add(:base, "You already have an active character")
  end

  def lenghty
    self.name.length > 1
    errors.add(:name, "has to be more than 1 char")
  end


end
