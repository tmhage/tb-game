class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable
  has_many :characters, dependent: :destroy
  has_one :active_character, -> { where(alive: true) }, class_name: 'Character', dependent: :destroy
end
