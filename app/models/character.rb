class Character < ApplicationRecord
  scope :online, -> { where(:online => true) }
  belongs_to :user
  mount_uploader :image, ImageUploader
  validate :have_active_character?
  validates :name, length: {minimum: 3, maximum: 16}
  validates :gender, inclusion: { in: %w(male female) }
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
    if !user.active_character.nil?
      errors.add(:base, "You already have an active character")
    end
  end



end
