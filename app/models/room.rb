class Room < ApplicationRecord
  validates :hotel_name, :hotel_introduction, :price, :address, presence: true
  validates :price, numericality: { only_integer: true }
  mount_uploader :hotel_image, ImageUploader
  belongs_to :user
  has_many :reservations
  has_many :users, through: :reservations
end
