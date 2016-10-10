class Character < ApplicationRecord
  GENDERS = ["1","2"]

  RANKS = {
    1 => "Soldier",
    2 => "Sergeant",
    3 => "General"
  }

  scope :online, -> { where(:online => true) }
  belongs_to :user
  mount_uploader :image, ImageUploader
  validate :have_active_character?
  validates :name, length: {minimum: 3, maximum: 16}
  validates :gender, inclusion: { in: GENDERS }
  validates_presence_of :name,:image,:gender,:user
  validates_uniqueness_of :name, :message => "This name is already being used"



  def rankname
    RANKS[self.rank]
  end

  def have_active_character?
    if !user.active_character.nil?
      errors.add(:base, "You already have an active character")
    end
  end

  def toggle_online
    self.toggle!(:online)
  end



end
