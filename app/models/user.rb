class User < ApplicationRecord
  has_many :rooms
  has_many :reservations
  has_many :reservation_rooms, through: :reservations, source: :room

  mount_uploader :image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
