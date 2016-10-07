class Character < ApplicationRecord
  belongs_to :user
  # validates_uniqueness_of :name, :character_id, :message => "This name is already being used"
  # validates :name, :presence => {:message => 'Name cannot be blank, Task not saved'}
end
