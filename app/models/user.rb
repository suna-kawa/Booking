class User < ApplicationRecord
  has_many :rooms
  # 画像用カラムとアップローダークラスを紐付ける
  mount_uploader :image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
